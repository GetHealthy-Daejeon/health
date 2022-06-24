package com.dw.health.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dw.health.service.MemberService;
@Controller
@RequestMapping("/health")
public class LoginController {
	
	@Autowired
	MemberService memberService;
	
//로그인 화면
	@RequestMapping("/login")
	public String callLoginPage() {
		return "login";
	}
	
//	@RequestMapping(value = "/login" , method = {RequestMethod.GET, RequestMethod.POST})
//	public String callLoginPage() {
//		return "login";
//	}
	
	@GetMapping("join")
	public String callJoinPage() {
		return "join";
	}
	
	@GetMapping("/member")
	public String loadMemberPage() {
		return "member";
	}

}
