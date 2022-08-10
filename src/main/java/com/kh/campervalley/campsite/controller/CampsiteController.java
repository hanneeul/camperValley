package com.kh.campervalley.campsite.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.campsite.model.service.CampsiteService;
import com.kh.campervalley.common.CampsiteApiData;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/campsite")
@PropertySource("classpath:datasource.properties")
public class CampsiteController {
	
	@Autowired
	private CampsiteService campsiteService;
	
	
	@GetMapping("/searchDetail")
	public void searchDetail(Model model, @Value("${api.goCamping}") String SERVICE_KEY) throws IOException, ParseException {
		ArrayList<HashMap<String, Object>> list = CampsiteApiData.getApiData(SERVICE_KEY);
		
		
        model.addAttribute("list", list);
	}
	
	@GetMapping("/searchTheme")
	public void searchTheme(Model model, @Value("${api.goCamping}") String SERVICE_KEY) throws IOException, ParseException {
		ArrayList<HashMap<String, Object>> list = CampsiteApiData.getApiData(SERVICE_KEY);
        model.addAttribute("list", list);
	}
	
	@GetMapping("/infoView")
	public void infoView() {}
	
}
