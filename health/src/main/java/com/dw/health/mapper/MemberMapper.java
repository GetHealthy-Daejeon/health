package com.dw.health.mapper;

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
	
	


}
