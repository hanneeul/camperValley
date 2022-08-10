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

import com.kh.campervalley.campsite.model.dto.CampsiteExt;
import com.kh.campervalley.campsite.model.service.CampsiteService;
import com.kh.campervalley.common.CampsiteApiData;

import lombok.extern.slf4j.Slf4j;

//@Controller
//@Slf4j
//@RequestMapping("/campsite")
//@PropertySource("classpath:datasource.properties")
public class CampsiteController22 {
	
	@Autowired
	private CampsiteService campsiteService;
	
	
	@GetMapping("/searchDetail")
	public void searchDetail(Model model, @Value("${api.goCamping}") String SERVICE_KEY) throws IOException, ParseException {
		ArrayList<HashMap<String, Object>> list = CampsiteApiData.getApiData(SERVICE_KEY);
		for(int i = 0; i < list.size(); i++) {
		    HashMap<String, Object> item = list.get(i);
		    
		    Long contentId = (Long) item.get("contentId");
			String facltNm = (String) item.get("facltNm");
			String lineIntro = (String) item.get("lineIntro");
			String intro = (String) item.get("intro");
			String facltDivNm = (String) item.get("facltDivNm");
			String induty = (String) item.get("induty");
			String lctCl = (String) item.get("lctCl");
			String addr1 = (String) item.get("addr1");
			String addr2 = (String) item.get("addr2");
			String mapX = (String) item.get("mapX");
			String mapY = (String) item.get("mapY");
        	String tel = (String) item.get("tel");
        	String homepage = (String) item.get("homepage");
        	String resveCl = (String) item.get("resveCl");
        	String operPdCl = (String) item.get("operPdCl");
        	String operDeCl = (String) item.get("operDeCl");
        	String posblFcltyCl = (String) item.get("posblFcltyCl");
        	String themaEnvrnCl = (String) item.get("themaEnvrnCl");
        	String firstImageUrl = (String) item.get("firstImageUrl");
			
        	CampsiteExt campsite = new CampsiteExt(contentId, facltNm, lineIntro, intro, facltDivNm,
        			induty, lctCl, addr1, addr2, mapX, mapY, tel, homepage, resveCl, operPdCl,
        			operDeCl, posblFcltyCl, themaEnvrnCl, firstImageUrl);
        	
        	// int result = campsiteService.insertCampsite(campsite);
		}
		
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
