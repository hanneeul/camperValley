package com.kh.campervalley.member.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
//	@Autowired
//	MemberService memberService;
	
//	@Autowired
//	BCryptPasswordEncoder bcryptPasswordEncoder;
//	
	//회원가입페이지
	@GetMapping("/enroll")
	public void memberEnroll() {}
	
	@GetMapping("/enrollSuccess")
	public void memberEnrollSuccess() {}
	
	@GetMapping("/resetPassword")
	public void resetPassword(){}
	
	@GetMapping("/searchId")
	public void searchId() {}
	
	@GetMapping("/searchPassword")
	public void memberDetail() {
	}
	
	@GetMapping("/login")
	public void login() {
	}

}
