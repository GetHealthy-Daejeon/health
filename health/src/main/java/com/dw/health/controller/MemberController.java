package com.dw.health.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dw.health.service.MemberService;
import com.github.pagehelper.PageInfo;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberservice;

	@GetMapping("/health/members")
	public String loadMemberPage(ModelMap map, 
			@RequestParam("pageNum") int pageNum,
			@RequestParam("pageSize") int pageSize,
			HttpSession session) {

		List<Map<String, Object>> list = memberservice.getAllMemberList(pageNum, pageSize);

		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(list);
		map.addAttribute("pageHelper", pageInfo);
		
		return "member";
	}

	@GetMapping("/members/search")
	public String callBoardSearch(ModelMap map,
			@RequestParam("name") String name,
			@RequestParam("pageNum")int pageNum,
			@RequestParam("pageSize")int pageSize
			){
		List<Map<String,Object>> list = memberservice.memberSearchList(pageNum, pageSize, name);
		PageInfo<Map<String,Object>> pageInfo = new PageInfo<Map<String,Object>>(list);
		map.addAttribute("pageHelper", pageInfo);
		return "member";
	}
}
