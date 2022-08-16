package com.kh.campervalley.tradereview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.tradereview.model.dto.TradeReview;
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
	
	@PostMapping("/reviewEnroll")
	public String reviewEnroll(TradeReview tradeReview) {
		try {
			int result = tradereviewService.insertReview(tradeReview);
		} catch(Exception e) {
			log.error("거래후기 등록 오류", e);
			throw e;
		}
		return "redirect:/mypage/trade/purchased";
	}
	
	@GetMapping("/reviewUpdate")
	public void reviewUpdate() {}
	
	@GetMapping("/reportEnroll")
	public void reportEnroll() {}
	
	@GetMapping("/profileCheck")
	public void profileCheck() {}
	
}
