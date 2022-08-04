package com.kh.campervalley.mypage.info.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage/info")
@Slf4j
public class InfoController {
	//Autowired
	
	@GetMapping("/edit")
	public void mypageUpdate() {
	}
	@GetMapping("/main")
	public void mypage() {
	}

}
