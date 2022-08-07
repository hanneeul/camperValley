package com.kh.campervalley.tradereview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.tradereview.model.service.TradereviewService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/tradereview")
public class TradereviewController {

	@Autowired
	private TradereviewService tradereviewService;
	
	@GetMapping("/reviewEnroll")
	public void reviewEnroll() {}
	
	@GetMapping("/reviewUpdate")
	public void reviewUpdate() {}
	
	@GetMapping("/reportEnroll")
	public void reportEnroll() {}
	
	@GetMapping("/profileCheck")
	public void profileCheck() {}
	
}
