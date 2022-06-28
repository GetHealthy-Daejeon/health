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
		// 학생 비밀번호 암호화
		String password = vo.getMemberPassword();
		password = passwordEncoder.encode(password);
		vo.setMemberPassword(password);
		return membermapper.doJoin(vo);
	}

	
	// 가입된 학생인지 아닌지 체크
	@Transactional(rollbackFor = { Exception.class })
	public boolean ismember(MemberVO vo, HttpSession httpSession) {

		MemberVO member = membermapper.selectStudentsOne(vo);
		// 회원이 있는지 없는지 부터 체크
		if (member == null) { // query결과가 null로 리턴
			return false;
		}
		String inputPassword = vo.getMemberPassword(); // HTML에 입력된 패스워드
		String password = member.getMemberPassword(); // DB에서 가져온 진짜 패스워드

		// passwordEncoder클래스에서 사용할 수 있는 method matches
		// 괄호안에 두 값이 암호화 된 상태인데 서로 같은지를 비교해줌
		if (!passwordEncoder.matches(inputPassword, password)) { // 비밀번호 체크
			return false;
		}
		httpSession.setAttribute("memberId", member.getMemberId());
		httpSession.setAttribute("memberName", member.getMemberName());

		return true;
	}

	
	//회원 전체 조회 
	@Transactional(rollbackFor = {Exception.class})
	public List<Map<String,Object>> getAllMemberList(int pageNum, int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return membermapper.selectAllMemberList();
	}
	
	//회원 상세 조회
	public MemberVO getMember(int memberId) {
		return membermapper.selectMemberOne(memberId);
	}
	
	
	//회원 정보 수정
	@Transactional(rollbackFor = Exception.class)
	public int getUpdateMember(MemberVO vo, int memberId) {
		vo.setMemberId(memberId);
		return membermapper.updateMember(vo);
	}
	
	// 회원 삭제
	@Transactional(rollbackFor = {Exception.class})
	public int deleteMember(int memberId) {
		
		
		return membermapper.deleteMember(memberId);
	}
}
