package com.kh.campervalley.campsite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void searchDetail(Model model) {
		List<CampsiteExt> list = campsiteService.recentCampsiteList();
        model.addAttribute("list", list);
	}
	
	@GetMapping("/searchTheme")
	public void searchTheme(Model model) {
		List<CampsiteExt> list = campsiteService.recentCampsiteList();
        model.addAttribute("list", list);
	}
	
	@GetMapping("/infoView")
	public void infoView() {}
	
}
