package com.dw.health.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dw.health.service.MapService;
import com.dw.health.vo.MapVO;

@RequestMapping("/addr")
@RestController
public class MapRestController {
	
	@Autowired
	private MapService mapservice;
	
//	주소 상세 조회
	@CrossOrigin
	@GetMapping("/placeNO/{placeNO}")
	public MapVO selectAddrOne(@PathVariable("placeNO") int placeNO) {
		return mapservice.selectAddrOne(placeNO);
	}
	
// 특정 주소 수정
	@CrossOrigin
	@PatchMapping("/placeNO/{placeNO}")
	public int updateAddrOne(
			@PathVariable("placeNO") int placeNO,
			@RequestBody MapVO vo) {
		return mapservice.updateAddrOne(vo,placeNO);
	}
	


}
