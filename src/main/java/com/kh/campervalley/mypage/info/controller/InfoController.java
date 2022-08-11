package com.kh.campervalley.mypage.info.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.campervalley.member.model.dto.Member;
import com.kh.campervalley.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage/info")
@Slf4j
public class InfoController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	
	@GetMapping("/edit")
	public void mypageUpdate(@AuthenticationPrincipal Member member) {
	}
	
	@PostMapping("/edit")
	public String mypageUpdate(Member updateMember,
								@AuthenticationPrincipal Member loginMember,
								RedirectAttributes redirectAttr) {
		
		
		Map<String, Object> map = new HashMap<>();
		try {
			System.out.println(updateMember.getPassword()==null + "");
			System.out.println(updateMember.getPassword().equals(""));
			
			//파일 처리
			
			
			//비밀번호 암호화
			if(updateMember.getPassword().equals(""))
				updateMember.setPassword(loginMember.getPassword());
			else
				updateMember.setPassword(bcryptPasswordEncoder.encode(updateMember.getPassword()));
			//업데이트 처리
			log.debug("updateMember = {}", updateMember);
			log.debug("loginMember = {}", loginMember);
			int result = memberService.updateMember(updateMember);
			log.debug("121");
			log.debug(result+"");
			//Authentication 대체??
//			loginMember.setNickname(updateMember.getNickname());
//			loginMember.setEmail(updateMember.getEmail());
//			loginMember.setName(updateMember.getTel());
//			loginMember.setName(updateMember.getProfilImg());
			
			// 비밀번호 바뀌었을 
			
			//msg저장
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/mypage/info/edit";
	}
	
	@GetMapping("/main")
	public void mypage(@AuthenticationPrincipal Member member) {
		log.debug("member = {}", member);
	}
	
	@GetMapping("/withdrawal")
	public void withdrawal() {}

}
