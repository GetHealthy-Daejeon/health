package com.dw.health.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dw.health.service.MemberService;
import com.dw.health.vo.MemberVO;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/health")
public class MemberController {

	@Autowired
	private MemberService memberservice;

	// 멤버 저장
	// post는 body로 데이터를 받음
	@PostMapping("/join")
	public int callSaveStudents(@RequestBody MemberVO vo) {
		return memberservice.doJoin(vo);
	}

	// 중요한 정보를 서버에 전송할 때 post사용
	// 회원이 있는지 없는지 true , false로 확인.
	@CrossOrigin
	@PostMapping("/login")
	public boolean callIsLogin(@RequestBody MemberVO vo, HttpSession httpSession) {
		boolean isLogin = memberservice.ismember(vo, httpSession);
		return isLogin;
	}

//	@CrossOrigin
//	@GetMapping("/member")
//	public PageInfo<Map<String,Object>> callMemberList(@RequestParam("pageNum")int pageNum,
//			@RequestParam("pageSize")int pageSize){
//		
//		List<Map<String, Object>> list = memberservice.getAllMemberList(pageNum,pageSize); 
//		return new PageInfo<Map<String,Object>>(list);
//	}
	
	// map으로 학생 조회
	@GetMapping("/member/map")
	public List<Map<String, Object>> callMemberListByMap(HttpSession httpSession){
		return memberservice.getAllMemberMap();
	}

	// 특정 멤버 삭제
	@CrossOrigin
	@DeleteMapping("/member/id/{id}")
	public int callRemoveMember(@PathVariable("id") int memberId) {
		return memberservice.deleteMember(memberId);
	}
}
