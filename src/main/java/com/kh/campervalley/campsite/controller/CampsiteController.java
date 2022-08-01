package com.kh.campervalley.campsite.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.campsite.model.service.CampsiteService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/campsite")
public class CampsiteController {
	
//	@Autowired
	private CampsiteService campsiteService;

	@GetMapping("/searchDetail")
	public void searchDetail() {}
	
	@GetMapping("/searchTheme")
	public void searchTheme() {}
}
