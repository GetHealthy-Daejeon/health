package com.dw.health.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dw.health.service.MemberService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/health")
public class LoginController {

	@Autowired
	MemberService memberService;
	
	//메인 화면
	@GetMapping("/index")
	public String callMainPage(ModelMap map, HttpSession httpSession) {
		
		String authority = "";
		String name = "";
		//세션이 null일때 바로 로그인으로 가게 하는 로직
//		if(httpSession.getAttribute("authority") == null) {
//			return "redirect:/health/login";
//		}
		if(httpSession.getAttribute("authority") != null) {
			authority = httpSession.getAttribute("authority").toString();
		}
		if(httpSession.getAttribute("memberName") != null) {
			name = httpSession.getAttribute("memberName").toString();
		}
		map.put("authority", authority);			
		map.put("name", name);
		return "index";
	}

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
		return "/join";
	}
	

	
	@GetMapping("/logout")
	public String callLoginout(HttpSession httpSession) {
		// 세션 remove
		httpSession.removeAttribute("memberName");
		httpSession.removeAttribute("memberPassword");
		httpSession.removeAttribute("authority");
		return "login";
	}

}
