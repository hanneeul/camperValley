package com.kh.campervalley.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cs")
@Slf4j
public class CsController {
	
	@GetMapping("/noticeList")
	public void noticeList() {}
	
	@GetMapping("/noticeEnroll")
	public void noticeEnroll() {}

	@GetMapping("/noticeUpdate")
	public void noticeUpdate() {}

	@GetMapping("/noticeDetail")
	public void noticeDetail() {}

}
