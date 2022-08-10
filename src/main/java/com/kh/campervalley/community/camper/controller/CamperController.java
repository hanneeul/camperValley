package com.kh.campervalley.community.camper.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public void camperList() {}
	
	@GetMapping("/camperEnroll")
	public void camperEnroll() {}
	
	@GetMapping("/camperUpdate")
	public void camperUpdate() {}
	
	@PostMapping("camperEnroll")
	public ModelAndView camperEnroll(Camper camper) {
		ModelAndView mav = new ModelAndView();
		try {
			log.debug("camper = {}", camper);
			int result = camperService.insertCamper(camper);
			mav.addObject("msg", "글을 성공적으로 등록했습니다.");
			mav.setViewName("redirect:/");
		} catch(Exception e) {
			log.error("캠퍼모집글 등록 오류");
			throw e;
		}
		return mav;
	}
}
