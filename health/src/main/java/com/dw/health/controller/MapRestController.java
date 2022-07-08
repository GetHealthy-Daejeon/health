package com.dw.health.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dw.health.service.MapService;
import com.dw.health.vo.MapVO;
import com.github.pagehelper.PageInfo;

@RequestMapping("/addr")
@RestController
public class MapRestController {
	
	@Autowired
	private MapService mapservice;
// 주소 추가
	@CrossOrigin
	@PostMapping("/insert")
	public int insertAddr(@RequestBody MapVO vo) {
		return mapservice.insertAddr(vo);
	}
	
//	주소 상세 조회
	@CrossOrigin
	@GetMapping("/placeno/{place_no}")
	public MapVO selectAddrOne(@PathVariable("place_no") int placeno) {
		return mapservice.selectAddrOne(placeno);
	}
	
// 특정 주소 수정
	@CrossOrigin
	@PatchMapping("/placeno/{place_no}")
	public int updateAddrOne(
			@PathVariable("place_no") int placeno,
			@RequestBody MapVO vo) {
		return mapservice.updateAddrOne(vo,placeno);
	}
	
// 특정 주소 삭제
	@CrossOrigin
	@DeleteMapping("/delete/{place_no}")
	public int callRemoveMember(
			@PathVariable("place_no") int placeno) {
		return mapservice.deleteAddr(placeno);
	}
	
	//주소 검색
	@CrossOrigin
	@GetMapping("/map/search")
	public PageInfo<Map<String, Object>> callBoardSearch(@RequestParam("name") String name,
			@RequestParam("pageNum") int pageNum, 
			@RequestParam("pageSize") int pageSize){
		
		List<Map<String, Object>> list = mapservice.getSearchBoardList(name, pageNum, pageSize);
		return new PageInfo<Map<String, Object>>(list);
	}

// 통계
	@CrossOrigin
	@GetMapping("/FacilityStatistics")
	public Map<String, Object> callAllFacilityCount(){
		return mapservice.getAllFacilityCount();
	}
}
