package com.dw.health.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dw.health.service.BoardService;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/health") 
public class BoardRestController {
	
	@Autowired
	private BoardService boardService;
	
	//게시판 전체조회 (R)
	@CrossOrigin
	@GetMapping("/board")
	//리턴타입을 List<Map<String, Object>> => PageInfo<Map<String, Object>>
	public PageInfo<Map<String, Object>> callBoardList(@RequestParam("pageNum") int pageNum, 
			@RequestParam("pageSize") int pageSize){
		
		List<Map<String, Object>> list = boardService.getAllBoardList(pageNum, pageSize);
		
		return new PageInfo<Map<String, Object>>(list);
	}

}
