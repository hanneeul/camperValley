package com.kh.campervalley.mypage.advertiser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.mypage.advertiser.model.service.AdvertiserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage/advertiser")
@Slf4j
public class AdvertiserController {
	
	@Autowired
	private AdvertiserService advertiserService;
	
	@GetMapping("/register")
	public void registerAdvertiser() { }
	
	@GetMapping("/exit")
	public void exitAdvertiser() { }
	
	@GetMapping("/dashboard")
	public void advertiserDashBoard() {	}
	

}
