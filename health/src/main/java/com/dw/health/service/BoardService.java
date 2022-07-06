package com.dw.health.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dw.health.mapper.BoardMapper;
import com.github.pagehelper.PageHelper;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	//게시판 전체 조회
	//pageNum : 현재 페이지, pageSize: 한 페이지에 게시물 몇개 보여줄지
	public List<Map<String, Object>> getAllBoardList(int pageNum, int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return boardMapper.selectAllBoardList();
	}

}
