package com.kh.campervalley.tradereview.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.campervalley.common.CamperValleyUtils;
import com.kh.campervalley.member.model.dto.Member;
import com.kh.campervalley.tradereview.model.dto.TradeReview;
import com.kh.campervalley.tradereview.model.dto.TradeReviewExt;
import com.kh.campervalley.tradereview.model.service.TradereviewService;
import com.kh.campervalley.usedProduct.model.dto.UsedProduct;

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
			int result = tradereviewService.deleteReview(reviewNo);
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
	public ModelAndView profileCheck(@RequestParam(defaultValue = "honggd") String memberId, ModelAndView mav) {
		try {
			// 별점평균, 판매상품/거래리뷰 갯수
			Map<String, Object> counts = tradereviewService.selectCounts(memberId);
			
			mav.addObject("counts", counts);
			mav.addObject("member", memberId);
			mav.setViewName("/tradereview/profileCheck");
		} catch(Exception e) {
			log.error("판매자 정보 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/reviewList")
	public ModelAndView reviewList(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam String memberId, 
			ModelAndView mav,
			HttpServletRequest request) {
		try {
			int numPerPage = TradereviewService.NUM_PER_PAGE;
			List<TradeReviewExt> reviewList = tradereviewService.selectReviewListByMemberId(cPage, numPerPage, memberId);
			
			// 페이지바
			int totalContent = tradereviewService.selectTotalReviewByMemberId(memberId);
			String pagebar = CamperValleyUtils.getPagebarAsync(cPage, numPerPage, totalContent, request.getRequestURI());
			log.debug("totalContent = {}", totalContent);
			mav.addObject("reviewList", reviewList);
			mav.addObject("pagebar", pagebar);
			mav.setViewName("jsonView");
		} catch(Exception e) {
			log.error("판매자 거래리뷰 목록 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
}
