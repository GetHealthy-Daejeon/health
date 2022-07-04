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
		if(httpSession.getAttribute("authority") == null) {
			return "redirect:/health/login";
		}
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
	

	@GetMapping("/members")
	public String loadMemberPage(ModelMap map, 
			@RequestParam("pageNum") int pageNum,
			@RequestParam("pageSize") int pageSize,
			HttpSession session) {

		List<Map<String, Object>> list = memberService.getAllMemberList(pageNum, pageSize);

		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(list);
		map.addAttribute("pageHelper", pageInfo);

//		int memberId = (int) session.getAttribute("memberId");
//		map.addAttribute("memberId", memberId);
		
		return "member";
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
