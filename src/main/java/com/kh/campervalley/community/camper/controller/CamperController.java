package com.kh.campervalley.community.camper.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.community.camper.model.service.CamperService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/community/camper")
public class CamperController {

	@Autowired
	private CamperService camperSerivce;
	
	@GetMapping("/camperList")
	public void camperList() {
	}
	
	@GetMapping("/camperEnroll")
	public void camperEnroll() {
	}
}
