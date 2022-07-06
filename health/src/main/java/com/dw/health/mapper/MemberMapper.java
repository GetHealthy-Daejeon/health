package com.dw.health.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	
	public MemberVO selectMemberOne(MemberVO vo);
	public MemberVO selectLoginOne(MemberVO vo);
	
	
	/**
	 * @return
	 * @author : Minyoung Kim
	 * @date : 2022. 6. 24.
	 * comment : 회원 조회
	 */
	public List<Map<String,Object>> selectAllMemberList();
	public List<Map<String,Object>> memberSearchList(@Param("memberName") String memberName);
	
	/**
	 * @param memberId
	 * @return
	 * @author : Minyoung Kim
	 * @date : 2022. 6. 27.
	 * comment : 누른 회원 상세 조회
	 */
	public MemberVO selectMemberOne(int memberId);
	
	/** 
	 * @param vo 
	 * @return
	 * @author : Minyoung Kim
	 * @date : 2022. 6. 27.
	 * comment : 회원 수정
	 */
	public int updateMember(MemberVO vo);
	
	
	
	/**
	 * @param memberId
	 * @return
	 * @author : Minyoung Kim
	 * @date : 2022. 6. 24.
	 * comment : 회원 삭제
	 */
	public int deleteMember(int memberId);
	
	


}
