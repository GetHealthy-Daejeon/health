package com.dw.health.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dw.health.service.MemberService;
import com.dw.health.vo.MemberVO;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/health")
public class MemberRestController {

	@Autowired
	private MemberService memberservice;

	// 멤버 저장
	// post는 body로 데이터를 받음
	@PostMapping("/join")
	public int callSaveStudents(@RequestBody MemberVO vo) {
		return memberservice.doJoin(vo);
	}

	// 중요한 정보를 서버에 전송할 때 post사용
	// 회원이 있는지 없는지 true , false로 확인.
	@CrossOrigin
	@PostMapping("/login")
	public boolean callIsLogin(@RequestBody MemberVO vo, HttpSession httpSession) {
		boolean isLogin = memberservice.ismember(vo, httpSession);

		return isLogin;
	}
	 
	//회원 상세보기 (R)
	@CrossOrigin
	@GetMapping("/member/{id}")
	public MemberVO callBoard(@PathVariable("id") int memberId) {
		return memberservice.getMember(memberId);
	}
	
	//회원 수정 (U)
	/* @PatchMapping("/member/{id}") */
	@CrossOrigin
	@RequestMapping(value="/member/{id}", method= {RequestMethod.PATCH})
	public int callUpdateMember(@PathVariable("id") int memberId, @RequestBody MemberVO vo) {
		return memberservice.getUpdateMember(vo, memberId);
	}
	
	//회원 삭제 (D)
	//@DeleteMapping("/member/{id}")
	@CrossOrigin
	@RequestMapping(value="/member/{id}", method= {RequestMethod.DELETE})
	public int callRemoveMember(@PathVariable("id") int memberId) {
		return memberservice.deleteMember(memberId);
	}
	
	//회원 검색
	@CrossOrigin
	@GetMapping("/members/search")
	public PageInfo<Map<String,Object>> callMemberList(@RequestParam("name") String name,
			@RequestParam("pageNum")int pageNum,
			@RequestParam("pageSize")int pageSize){
		List<Map<String, Object>> list = memberservice.memberSearchList(pageNum,pageSize,name);
		return new PageInfo<Map<String,Object>>(list);
	}
}
