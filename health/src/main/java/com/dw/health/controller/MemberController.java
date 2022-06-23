package com.dw.health.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dw.health.service.MemberService;
import com.dw.health.vo.memberVO;

@RestController
@RequestMapping("/health")
public class MemberController {

	@Autowired
	private MemberService memberservice;

	// 멤버 저장
	// post는 body로 데이터를 받음
	@CrossOrigin
	@PostMapping("/join")
	public int callSaveStudents(@RequestBody memberVO vo) {
		return memberservice.doJoin(vo);
	}

	// 중요한 정보를 서버에 전송할 때 post사용
	// 회원이 있는지 없는지 true , false로 확인.
	@CrossOrigin
	@PostMapping("/login")
	public boolean callIsLogin(@RequestBody memberVO vo, HttpSession httpSession) {
		boolean isLogin = memberservice.ismember(vo, httpSession);
		return isLogin;
	}
//	// 중요한 정보를 서버에 전송할 때 post사용
//	@CrossOrigin
//	@PostMapping("/login")
//	public boolean callIsLogin(@RequestBody memberVO vo, HttpSession httpSession) {
//		boolean isLogin = memberservice.isStuents(vo, httpSession);
//		return isLogin;
//	}

}
