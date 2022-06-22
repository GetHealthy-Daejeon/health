package com.dw.health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/health")
public class LoginController {
	
	@RequestMapping(value = "/login" , method = {RequestMethod.GET, RequestMethod.POST})
	public String callLoginPage() {
		return "login";
	}
	
	@GetMapping("join")
	public String callJoinPage() {
		return "join";
	}

}
