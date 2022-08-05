package com.kh.campervalley.member.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping("/enrollSuccess")
	public void memberEnrollSuccess() {}
	
	@GetMapping("/login")
	public void memberLogin() {}
	
	@GetMapping("/resetPassword")
	public void resetPassword(){}
	
	@GetMapping("/searchId")
	public void searchId() {}
	
	@GetMapping("/searchPassword")
	public void memberDetail() {
	}
}
