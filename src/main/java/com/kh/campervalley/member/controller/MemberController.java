package com.kh.campervalley.member.controller;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.campervalley.member.model.dto.Member;
import com.kh.campervalley.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
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

	@PostMapping("/enroll")
	public String memberEnroll(Member member, RedirectAttributes redirectAttr) {
		log.debug("member = {}", member);
		try {
			String rawPassword = member.getPassword();
			String encryptedPassword = bcryptPasswordEncoder.encode(rawPassword);
			member.setPassword(encryptedPassword);
			log.debug("member.getPassword={}", member.getPassword());
			
			int result = memberService.insertMember(member);
			
			log.info("회원가입 성공");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return "redirect:/member/enrollSuccess";
	}
	
	@GetMapping("/checkDuplicate")
	public ResponseEntity<?> checkIdDuplicate(@RequestParam String value,
			@RequestParam String attribute){
		
		Map<String, Object> map = new HashMap<>();
		try {
			Member member = memberService.selectOneMember(attribute, value);
			boolean available = member == null;// 사용가능 true 1 사용불가능 false 0
			
			map.put("value", value);
			map.put("available", available);
			log.debug("컨트롤러 중복검사");
		} catch (Exception e) {
			log.error("중복검사 체크 오류", e);
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
	
	@PostMapping("/searchId")
	public ResponseEntity<?> searchId(@RequestParam String name,
						@RequestParam String email
			) {
		Map<String, Object> map = new HashMap<>();
		log.debug(name);
		log.debug(email);
		try {
			String memberId = memberService.selectIDByNameAndEmail(name, email);
			map.put("memberId", memberId);	
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity
					.status(HttpStatus.OK)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
		}
		return ResponseEntity
				.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				.body(map);
	}
}

