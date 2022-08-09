package com.kh.campervalley.cs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String faq(Model model) {
		try {
			List<Notice> list = csService.selectFaqList();
			log.debug("list = {}", list);
			model.addAttribute("list", list);
		} catch (Exception e) {
			log.error("faq 조회 오류", e);
		}
		return "cs/faq";
	}
	
	@PostMapping("/faqDelete")
	public String faqDelete(@RequestParam int noticeNo, Notice notice, RedirectAttributes redirectAttr) {
		try {
			int result = csService.faqDelete(noticeNo);
			redirectAttr.addFlashAttribute("msg", "게시글이 삭제되었습니다.");
		} catch (Exception e) {
			log.error("FAQ 삭제 오류", e);
		}
		return "redirect:/cs/faq";
	}
	
	@GetMapping("/faqEnroll")
	public void faqEnroll() {}
	
	@PostMapping("/faqEnroll")
	public String faqEnroll(Notice notice, RedirectAttributes redirectAttr) {
		try {
			log.debug("notiec = {}", notice);
			
			int result = csService.faqInsert(notice);
			log.debug("result = {}", result);
			
			redirectAttr.addFlashAttribute("msg", "게시글이 등록되었습니다.");
		} catch (Exception e) {
			log.error("FAQ 등록 오류", e);
		}
		return "redirect:/cs/faq";
	}
	
	@GetMapping("/faqUpdate")
	public String faqUpdate(@RequestParam int noticeNo, Model model) {
		try {
			Notice notice = csService.selectOneFaq(noticeNo);
			log.debug("notice = {}", notice);
			model.addAttribute("notice", notice);
		} catch (Exception e) {
			log.error("FAQ 수정 오류", e);
		}
		return "cs/faqUpdate";
	}
	
	@PostMapping("/faqUpdate")
	public String faqUpdate(Notice notice, RedirectAttributes redirectAttr) {
		int result = csService.faqUpdate(notice);
		redirectAttr.addFlashAttribute("msg", "게시글이 수정되었습니다.");
		return "redirect:/cs/faq";
	}

}
