package com.kh.campervalley.mypage.advertiser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.campervalley.mypage.advertiser.model.dto.Advertiser;
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

	@PostMapping("/register")
	public void registerAdvertiser(Advertiser advertiser, @RequestParam("adImg") MultipartFile upFile) {
		// 매개변수 추가해야됨 : @AuthenticationPrincipal Member member
		
	}
	
	@GetMapping("/exit")
	public void exitAdvertiser() { }
	
	@GetMapping("/dashboard")
	public void advertiserDashBoard() { }
	
	@GetMapping("/admoney")
	public void chargeAdmoney() { }
	
	@GetMapping("/enrollAd")
	public void enrollAd() { }
	
	@GetMapping("/sample")
	public void sample() { }

}
