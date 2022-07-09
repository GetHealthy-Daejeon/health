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
	private MapMapper mapMapper;
	
	//주소 추가
	@Transactional(rollbackFor = {Exception.class})
	public int insertAddr(MapVO vo) {
		return mapMapper.insertAddr(vo);
	}
	
	//주소 전체 조회 
	@Transactional(rollbackFor = {Exception.class})
	public List<Map<String,Object>> getAllAddrList(int pageNum, int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return mapMapper.selectAllAddrList();
	}
	
	//주소 상세 조회(주소 클릭시 조회)
	@Transactional(rollbackFor = {Exception.class})
	public MapVO selectAddrOne(int placeNo) {
		return mapMapper.selectAddrOne(placeNo);
	}
	
	//주소 정보 수정
	@Transactional(rollbackFor = Exception.class)
	public int updateAddrOne(MapVO vo, int placeNo) {
		vo.setPlaceNo(placeNo);
		return mapMapper.updateAddrOne(vo);
	}
	//주소 정보 삭제
	@Transactional(rollbackFor = {Exception.class})
	public int deleteAddr(int placeNo) {
		return mapMapper.deleteAddr(placeNo);
	}
	
	// 구별 데이터 list 가져오기
	// 유성구
	public List<Map<String, Object>> getYuseongFacilityList(){
		return mapMapper.selectYuseong();
	}
	public List<Map<String, Object>> getFacilityList(String facilityName){
		return mapMapper.facilityList(facilityName);
	}
	// 대덕구
	public List<Map<String, Object>> getDaedeokFacilityList(){
		return mapMapper.selectDaedeok();
	}
	// 동구
	public List<Map<String, Object>> getDongFacilityList(){
		return mapMapper.selectDong();
	}
	// 중구
	public List<Map<String, Object>> getJungFacilityList(){
		return mapMapper.selectJung();
	}
	// 서구
	public List<Map<String, Object>> getSeoFacilityList(){
		return mapMapper.selectSeo();
	}
	// 종목코드별 조회
	public List<Map<String, Object>> getEventCode(String eventCode){
		return mapMapper.selectEventCode(eventCode);
	}
	
	//주소 검색 조회
	public List<Map<String, Object>> getSearchBoardList(String name,int pageNum, int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return mapMapper.selectSearchBoardList(name);
	}
	
	public Map<String,Object> getAllFacilityCount(){
		return mapMapper.selectAllFacility();
	}
}
