package com.dw.health.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.dw.health.vo.MapVO;

@Mapper
public interface MapMapper {
	
	
	/**
	 * @return
	 * @author : Minyoung Kim
	 * @date : 2022. 6. 30.
	 * comment : 모든 주소 조회(주소 보드)
	 */
	public List<Map<String,Object>> selectAllAddrList();
	
	public MapVO selectAddrOne(int placeNO);
	public int updateAddrOne(MapVO vo);
}
