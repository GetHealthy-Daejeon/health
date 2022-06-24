package com.dw.health.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.dw.health.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	/**
	 * @param vo
	 * @return
	 * @author : Minyoung Kim
	 * @date : 2022. 6. 22.
	 * comment : 회원가입
	 */
	public int doJoin(MemberVO vo);
	
	public MemberVO selectStudentsOne(MemberVO vo);
	
	
//	/**
//	 * @return
//	 * @author : Minyoung Kim
//	 * @date : 2022. 6. 24.
//	 * comment : 회원 조회
//	 */
//	public List<Map<String,Object>> selectAllMemberList();
	
	
	public List<Map<String, Object>> selectAllMemberMap();
	
	
	
	/**
	 * @param memberId
	 * @return
	 * @author : Minyoung Kim
	 * @date : 2022. 6. 24.
	 * comment : 회원 삭제
	 */
	public int deleteMember(int memberId);
	
	


}
