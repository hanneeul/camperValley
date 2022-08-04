package com.kh.campervalley.member.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.kh.campervalley.member.model.dto.Member;
//import com.kh.campervalley.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
//	@Autowired
//	MemberService memberService;
//	
//	@Autowired
//	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//회원가입페이지
	@GetMapping("/enroll")
	public void memberEnroll() {}
	
	@GetMapping("/login")
	public void memberLogin() {}
	
	
	@GetMapping("/searchId")
	public void searchId() {
	}
	
	@GetMapping("/searchPassword")
	public void memberDetail() {
	}
}
