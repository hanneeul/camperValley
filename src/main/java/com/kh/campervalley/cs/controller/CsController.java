package com.kh.campervalley.cs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.cs.model.dto.Notice;
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
	public ModelAndView faq(ModelAndView mav) {
		try {
			
			List<Notice> list = csService.selectFaqList();
			log.debug("list = {}", list);
			mav.addObject("list", list);
			
			mav.setViewName("cs/faq");
		} catch (Exception e) {
			log.error("faq 조회 오류", e);
		}
		return mav;
	}
	
	@GetMapping("/faqEnroll")
	public void faqEnroll() {}
	
	@GetMapping("/faqUpdate")
	public void faqUpdate() {}

}
