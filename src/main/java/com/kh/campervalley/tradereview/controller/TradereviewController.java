package com.kh.campervalley.tradereview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String reviewEnroll(TradeReview tradeReview, RedirectAttributes redirectAttr) {
		try {
			int result = tradereviewService.insertReview(tradeReview);
			redirectAttr.addFlashAttribute("msg", "거래후기를 성공적으로 등록했습니다.");
		} catch(Exception e) {
			log.error("거래후기 등록 오류", e);
			throw e;
		}
		return "redirect:/mypage/trade/purchased";
	}
	
	@GetMapping("/reviewUpdate")
	public void reviewUpdate() {}
	
	@PostMapping("/reviewUpdate")
	public String reviewUpdate(TradeReview tradeReview, RedirectAttributes redirectAttr) {
		try {
			int result = tradereviewService.updateReview(tradeReview);
			redirectAttr.addFlashAttribute("msg", "거래후기가 수정되었습니다.");
		} catch(Exception e) {
			log.error("거래후기 수정 오류", e);
			throw e;
		}
		return "redirect:/mypage/trade/purchased";
	}
	
	@PostMapping("/reviewDelete")
	public String reviewDelete(@RequestParam int reviewNo, RedirectAttributes redirectAttr) {
		try {
			int reulst = tradereviewService.deleteReview(reviewNo);
			redirectAttr.addFlashAttribute("msg", "거래후기가 삭제되었습니다.");
		} catch(Exception e) {
			log.error("거래후기 삭제 오류", e);
			throw e;
		}
		return "redirect:/mypage/trade/purchased";
	}
	
	
	@GetMapping("/reportEnroll")
	public void reportEnroll() {}
	
	@GetMapping("/profileCheck")
	public void profileCheck() {}
	
}
