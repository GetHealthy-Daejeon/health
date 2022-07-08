package com.dw.health.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	
	public int insertAddr (MapVO vo);
	public MapVO selectAddrOne(int placeno);
	public int updateAddrOne(MapVO vo);
	public int deleteAddr(int placeno);
	
	/**
	 * @return
	 * @author : Youngjoon Yoo 
	 * @date : 2022. 7. 1.
	 * comment : 유성구 조회 함수
	 */
	public List<Map<String, Object>> selectYuseong();

	public List<Map<String, Object>> dataTest();
	public List<Map<String, Object>> facilityList(String facilityName);
	
	/**
	 * @return
	 * @author : Daeun Yang
	 * @date : 2022. 7. 1.
	 * comment : 대덕구 조회 함수
	 */
	public List<Map<String, Object>> selectDaedeok();
	
	/**
	 * @return
	 * @author : Daeun Yang
	 * @date : 2022. 7. 1.
	 * comment : 동구 조회 함수
	 */
	public List<Map<String, Object>> selectDong();
	
	/**
	 * @return
	 * @author : Daeun Yang
	 * @date : 2022. 7. 1.
	 * comment : 중구 조회 함수
	 */
	public List<Map<String, Object>> selectJung();
	
	/**
	 * @return
	 * @author : Daeun Yang
	 * @date : 2022. 7. 1.
	 * comment : 서구 조회 함수
	 */
	public List<Map<String, Object>> selectSeo();
	
	/**
	 * @return
	 * @author : Daeun Yang
	 * @date : 2022. 7. 3.
	 * comment : 운동 종목 카테고리별 조회
	 */
	public List<Map<String, Object>> selectEventCode(String eventCode);
	
	public List<Map<String, Object>> selectSearchBoardList(@Param("fac_name") String fac_name);
	
	/**
	 * @return
	 * @author : YoungJoon Yoo
	 * @date : 2022. 7. 8.
	 * comment : 전체 시설 수 조회
	 */
	public Map<String, Object> selectAllFacility();
}
