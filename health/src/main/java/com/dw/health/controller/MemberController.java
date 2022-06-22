package com.dw.health.controller;

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

	@CrossOrigin
	@PostMapping("/join")
	public int doJoin(@RequestBody memberVO vo) {
		return memberservice.doJoin(vo);
	}

//	// 중요한 정보를 서버에 전송할 때 post사용
//	@CrossOrigin
//	@PostMapping("/login")
//	public boolean callIsLogin(@RequestBody memberVO vo, HttpSession httpSession) {
//		boolean isLogin = memberservice.isStuents(vo, httpSession);
//		return isLogin;
//	}
	

	

}
