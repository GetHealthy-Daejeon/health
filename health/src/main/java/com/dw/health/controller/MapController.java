package com.dw.health.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dw.health.service.MapService;
import com.github.pagehelper.PageInfo;

//@RequestMapping("/health")
@Controller
public class MapController {
	
	@Autowired
	private MapService mapservice;

	/* @GetMapping("/map") */
//	@RequestMapping(value = "/map", method = { RequestMethod.GET, RequestMethod.POST })
//	public String callMapPage() {
//		return "map";
//	}
	
	@GetMapping("/map")
	public String callHomepage(ModelMap map) {
		List<Map<String, Object>> yuseongList = mapservice.getYuseongFacilityList();
//		List<Map<String, Object>> list = excelService.getTestList();
		map.addAttribute("yuseongList", yuseongList);
		
		List<Map<String, Object>> daedeokList = mapservice.getDaedeokFacilityList();
		map.addAttribute("daedeokList", daedeokList);
		
		List<Map<String, Object>> dongList = mapservice.getDongFacilityList();
		map.addAttribute("dongList", dongList);
		
		List<Map<String, Object>> jungList = mapservice.getJungFacilityList();
		map.addAttribute("jungList", jungList);

		List<Map<String, Object>> seoList = mapservice.getSeoFacilityList();
		map.addAttribute("seoList", seoList);
		
		return "map";
	}

	@GetMapping("/addr")
	public String loadMemberPage(
			ModelMap map, 
			@RequestParam("pageNum") int pageNum,
			@RequestParam("pageSize") int pageSize, 
			HttpSession session) {

		List<Map<String, Object>> list = mapservice.getAllAddrList(pageNum, pageSize);

		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(list);
		map.addAttribute("pageHelper", pageInfo);

		return "map_back";
	}
	
	

}