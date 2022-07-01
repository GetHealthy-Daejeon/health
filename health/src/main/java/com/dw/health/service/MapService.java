package com.dw.health.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dw.health.mapper.MapMapper;
import com.dw.health.vo.MapVO;
import com.github.pagehelper.PageHelper;

@Service
public class MapService {
	
	@Autowired
	private MapMapper mapmapper;
	
	
	//주소 추가
	@Transactional(rollbackFor = {Exception.class})
	public int insertAddr(MapVO vo) {
		
		return mapmapper.insertAddr(vo);
	}
	
	
	//주소 전체 조회 
	@Transactional(rollbackFor = {Exception.class})
	public List<Map<String,Object>> getAllAddrList(int pageNum, int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return mapmapper.selectAllAddrList();
	}
	
	//주소 상세 조회(주소 클릭시 조회)
	@Transactional(rollbackFor = {Exception.class})
	public MapVO selectAddrOne(int placeno) {
		return mapmapper.selectAddrOne(placeno);
	}
	
	//회원 정보 수정
	@Transactional(rollbackFor = Exception.class)
	public int updateAddrOne(MapVO vo, int placeno) {
		vo.setPlace_no(placeno);
		return mapmapper.updateAddrOne(vo);
	}
	//회원 정보 삭제
	@Transactional(rollbackFor = {Exception.class})
	public int deleteAddr(int placeno) {
		return mapmapper.deleteAddr(placeno);
	}
	
	

}
