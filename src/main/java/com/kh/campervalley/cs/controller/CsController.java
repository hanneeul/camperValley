package com.kh.campervalley.cs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.cs.model.service.CsService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cs")
@Slf4j
public class CsController {
	
	@Autowired
	private CsService csService;
	
	@GetMapping("/noticeList")
	public void noticeList() {}
	
	@GetMapping("/noticeEnroll")
	public void noticeEnroll() {}

	@GetMapping("/noticeUpdate")
	public void noticeUpdate() {}

	@GetMapping("/noticeDetail")
	public void noticeDetail() {}

	@GetMapping("/faq")
	public void faq() {}
	
	@GetMapping("/faqEnroll")
	public void faqEnroll() {}
	
	@GetMapping("/faqUpdate")
	public void faqUpdate() {}

}
