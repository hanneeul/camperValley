package com.kh.campervalley.mypage.trade.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.community.camper.model.dto.Camper;
import com.kh.campervalley.community.camper.model.service.CamperService;
import com.kh.campervalley.member.model.dto.Member;
import com.kh.campervalley.mypage.trade.model.service.TradeService;
import com.kh.campervalley.usedProduct.model.dto.UsedProduct;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage/trade")
@Slf4j
public class TradeController {
	@Autowired
	private TradeService tradeService;
	
	int numPerReq = tradeService.TRADE_NUM_PER_REQUEST;
	
	@GetMapping("/purchased")
	public ModelAndView purchased(@AuthenticationPrincipal Member member) {
		ModelAndView mav = new ModelAndView();
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("memberId", member.getMemberId());
			map.put("numPerReq", TradeService.TRADE_NUM_PER_REQUEST);
			
			List<UsedProduct> list = tradeService.purchasedListByMemberId(map);
			log.debug("list={}",list);
			
			mav.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
		
	}
	
	@GetMapping("/selling")
	public ModelAndView selling(@AuthenticationPrincipal Member member) {
		ModelAndView mav = new ModelAndView();
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("memberId", member.getMemberId());
			map.put("numPerReq", numPerReq );
			
			List<UsedProduct> list = tradeService.sellingListByMemberId(map);
			log.debug("list={}",list);
			
			mav.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	//판매상품 추가 조회
	@GetMapping("/moreSalesProduct")
	public ResponseEntity<?> addSalesProduct(
						@RequestParam int cPage, @AuthenticationPrincipal Member member) {
		Map<String, Object> map = new HashMap<>();
		try {
			List<UsedProduct> salesProductList = tradeService.selectMoreSalesProduct(
					cPage, numPerReq, member.getMemberId());
			map.put("list", salesProductList);
			log.debug("{}",salesProductList);
		} catch(Exception e) {
			log.error("판매상품 목록 추가 조회 오류", e);
			map.put("error", e.getMessage());
			
			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
		}
		return ResponseEntity
				.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				.body(map);
	}
	
	@GetMapping("/sold")
	public void sold() {
		
	}
	@GetMapping("/wish")
	public void wish() {
		
	}


}
