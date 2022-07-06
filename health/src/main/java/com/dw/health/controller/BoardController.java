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

import com.dw.health.service.BoardService;
import com.github.pagehelper.PageInfo;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardSerivce;
	
	@GetMapping("/board")
	public String callBoardPage(ModelMap map,
			@RequestParam("pageNum") int pageNum,
			@RequestParam("pageSize") int pageSize,
			HttpSession session) {
		List<Map<String, Object>> list = boardSerivce.getAllBoardList(pageNum, pageSize);
		PageInfo<Map<String,Object>> pageInfo = new PageInfo<Map<String,Object>>(list);
		map.addAttribute("pageHelper",pageInfo);
		int memberId = (int)session.getAttribute("memberId");
		map.addAttribute("memberId",memberId);
		return "board";
	}

}
