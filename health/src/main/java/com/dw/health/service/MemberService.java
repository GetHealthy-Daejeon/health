package com.dw.health.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dw.health.mapper.MemberMapper;
import com.dw.health.vo.MemberVO;
import com.github.pagehelper.PageHelper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper membermapper;
	@Autowired
	private PasswordEncoder passwordEncoder; // Bean등록을 해 줘서 autowired가능

	//멤버 저장
	@Transactional(rollbackFor = { Exception.class })
	public int doJoin(MemberVO vo) {
		String password = vo.getMemberPassword(); // password에 웹에서 가져온 비밀번호 저장
		password = passwordEncoder.encode(password); // encoder로 password 암호화
		vo.setMemberPassword(password); // 웹에서 가져온 비밀번호에 암호화된 비밀번호 넣음
		return membermapper.doJoin(vo);
	}
	// 관리자페이지에서 멤버 등록
	public int setMember(MemberVO vo) {
		String password = vo.getMemberPassword();
		password = passwordEncoder.encode(password);
		vo.setMemberPassword(password);
		return membermapper.saveMemberByAdmin(vo);
	}
	
	// 가입된 학생인지 아닌지 체크
	@Transactional(rollbackFor = { Exception.class })
	public boolean ismember(MemberVO vo, HttpSession httpSession) {
		MemberVO member = membermapper.selectLoginOne(vo);
		// 회원이 있는지 없는지 부터 체크
		System.out.println(member);
		if (member == null) { // query결과가 null로 리턴
			return false;
		}
		String inputPassword = vo.getMemberPassword(); // HTML에 입력된 패스워드
		String password = member.getMemberPassword(); // DB에서 가져온 진짜 패스워드
		// 입력한 비밀번호와 db의 비밀번호 일치하는지 확인
		// html에서 받아온 비밀번호를 encoding 한 후 db의 비밀번호와 비교한다.
		if(!passwordEncoder.matches(inputPassword, password)) {
			return false;
		}
		// 세션에 정보 저장
		httpSession.setAttribute("memberPassword", member.getMemberPassword());
		httpSession.setAttribute("memberName", member.getMemberName());
		httpSession.setAttribute("authority", member.getAuthority());
		return true;
	}
	
	//회원 상세 조회
	public MemberVO getMember(int memberId) {
		return membermapper.selectMemberOne(memberId);
	}
	
	//회원 정보 수정
	@Transactional(rollbackFor = Exception.class)
	public int getUpdateMember(MemberVO vo, int memberId) {
		vo.setMemberId(memberId);
		String password = vo.getMemberPassword();
		password = passwordEncoder.encode(password);
		vo.setMemberPassword(password);
		return membermapper.updateMember(vo);
	}
	
	// 회원 삭제
	@Transactional(rollbackFor = {Exception.class})
	public int deleteMember(int memberId) {
		return membermapper.deleteMember(memberId);
	}

	//회원 전체 조회 
	public List<Map<String,Object>> getAllMemberList(int pageNum, int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return membermapper.selectAllMemberList();
	}
	
	// 회원이름 검색
	public List<Map<String, Object>> memberSearchList(int pageNum, int pageSize, String name){
		PageHelper.startPage(pageNum, pageSize);
		return membermapper.memberSearchList(name);
	}
}
