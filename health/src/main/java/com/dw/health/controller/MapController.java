package com.dw.health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


//@RequestMapping("/health")
@Controller
public class MapController {

	/* @GetMapping("/map") */
	@RequestMapping(value = "/map" , method = {RequestMethod.GET, RequestMethod.POST})
	public String callMapPage() {
		return "map";
	}
}
