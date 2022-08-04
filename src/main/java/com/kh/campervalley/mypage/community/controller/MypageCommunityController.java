package com.kh.campervalley.mypage.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage/community")
@Slf4j
public class MypageCommunityController {
	
//	@Autowired
//	private MypageCommunityService mypageCommunityService;

	// --------------------- EJ start
	@GetMapping("/bookmark")
	public void bookmarkList() {}
	// --------------------- EJ end
	
}
