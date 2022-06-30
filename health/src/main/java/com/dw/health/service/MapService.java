package com.dw.health.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dw.health.mapper.MapMapper;
import com.dw.health.vo.MapVO;
import com.dw.health.vo.MemberVO;
import com.github.pagehelper.PageHelper;

@Service
public class MapService {
	
	@Autowired
	private MapMapper mapmapper;
	
	
	//주소 전체 조회 
	@Transactional(rollbackFor = {Exception.class})
	public List<Map<String,Object>> getAllAddrList(int pageNum, int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return mapmapper.selectAllAddrList();
	}
	
	//주소 상세 조회(주소 클릭시 조회)
	@Transactional(rollbackFor = {Exception.class})
	public MapVO selectAddrOne(int placeNO) {
		return mapmapper.selectAddrOne(placeNO);
	}
	
	//회원 정보 수정
	@Transactional(rollbackFor = Exception.class)
	public int updateAddrOne(MapVO vo, int placeNO) {
		vo.setPlaceNO(placeNO);
		return mapmapper.updateAddrOne(vo);
	}

}
