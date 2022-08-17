package com.kh.campervalley.campsite.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.campsite.model.common.CampsiteApiData;
import com.kh.campervalley.campsite.model.dto.CampsiteExt;
import com.kh.campervalley.campsite.model.service.CampsiteService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/campsite")

public class CampsiteController {
	
	@Autowired
	private CampsiteService campsiteService;
	
	@Autowired
	CampsiteApiData campsiteApiData;
	
	@GetMapping("/searchDetail")
	public ModelAndView searchDetail(
			ModelAndView mav, 
			@RequestParam(required = false) String sido, 
			@RequestParam(required = false) String gugun, 
			@RequestParam(required = false) String facltNm, 
			HttpServletRequest request) {
		try {
			List<CampsiteExt> list = null;
			
			Map<String, Object> addr1 = new HashMap<>();
			addr1.put("sido", sido);
			addr1.put("gugun", gugun);
			
			if(facltNm == null) {
				list = campsiteService.recentCampsiteList();
			}
			else {
				list = campsiteService.searchCampsiteByFacltNm(facltNm);
			}
			mav.addObject("list", list);
			mav.setViewName("campsite/searchDetail");
			
		} catch (Exception e) {
			log.error("캠핑장 목록 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/searchTheme")
	public void searchTheme(Model model) {
		List<CampsiteExt> list = campsiteService.recentCampsiteList();
        model.addAttribute("list", list);
	}
	
	@GetMapping("/infoView")
	public void infoView() {}
	
}
