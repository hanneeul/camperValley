package com.kh.campervalley.mypage.trade.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.member.controller.MemberController;
import com.kh.campervalley.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage/trade")
@Slf4j
public class TradeController {
	//Autowired
	
	@GetMapping("/purchased")
	public void purchased() {
	}
	
	@GetMapping("/selling")
	public void selling() {
		
	}
	
	@GetMapping("/sold")
	public void sold() {
		
	}
	@GetMapping("/wish")
	public void wish() {
		
	}


}
