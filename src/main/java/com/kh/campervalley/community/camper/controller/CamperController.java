package com.kh.campervalley.community.camper.controller;

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

import com.kh.campervalley.community.camper.model.dto.Camper;
import com.kh.campervalley.community.camper.model.service.CamperService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/community/camper")
public class CamperController {

	@Autowired
	private CamperService camperService;
	
	@GetMapping("/camperList")
	public ModelAndView camperList(ModelAndView mav) {
		try {
			int numPerPage = CamperService.CAMPER_NUM_PER_PAGE;
			List<Camper> camperList = camperService.selectCamperList(numPerPage);
			mav.addObject("camperList", camperList);
			mav.setViewName("/community/camper/camperList");
		} catch(Exception e) {
			log.error("캠퍼모집 목록 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
	// 비동기 요청처리
	@GetMapping("/moreCamperList")
	public String moreCamperList(@RequestParam int cPage, Model model) {
		try {
			int numPerPage = CamperService.CAMPER_NUM_PER_PAGE;
			List<Camper> camperList = camperService.selectMoreCamperList(cPage, numPerPage);
			model.addAttribute("camperList", camperList);
		} catch(Exception e) {
			log.error("캠퍼모집 목록 추가 조회 오류", e);
			throw e;
		}
		return "jsonView";
	}
	
	@GetMapping("/camperEnroll")
	public void camperEnroll() {}
	
	@GetMapping("/camperUpdate")
	public void camperUpdate() {}
	
	@PostMapping("camperEnroll")
	public String camperEnroll(Camper camper, RedirectAttributes redirectAttr) {
		try {
			camper.setMemberId("honggd");
			log.debug("camper = {}", camper);
			int result = camperService.insertCamper(camper);
			redirectAttr.addFlashAttribute("msg", "글을 성공적으로 등록했습니다.");
		} catch(Exception e) {
			log.error("캠퍼모집글 등록 오류");
			throw e;
		}
		return "redirect:/community/camper/camperList";
	}
}
