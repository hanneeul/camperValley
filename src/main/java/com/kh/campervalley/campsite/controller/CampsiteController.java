package com.kh.campervalley.campsite.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.campsite.model.common.CampsiteApiData;
import com.kh.campervalley.campsite.model.dto.CampsiteExt;
import com.kh.campervalley.campsite.model.dto.CampsiteFacility;
import com.kh.campervalley.campsite.model.dto.CampsiteImage;
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
			@RequestParam(required = false) String facltDivNm, 
			@RequestParam(required = false) String lctCl, 
			@RequestParam(required = false) String induty, 
			HttpServletRequest request) throws Exception {
		try {
			List<CampsiteExt> list = null;
			
			Map<String, Object> searchParam = new HashMap<>();
			searchParam.put("sido", sido);
			searchParam.put("gugun", gugun);
			searchParam.put("facltNm", facltNm);
			searchParam.put("facltDivNm", facltDivNm);
			searchParam.put("lctCl", lctCl);
			searchParam.put("induty", induty);
			
			if(sido == null && gugun == null && facltNm == null && 
					facltDivNm == null && lctCl == null && induty == null) {
				list = campsiteService.recentCampsiteList();
			}
			else {
				list = campsiteService.searchCampsiteList(searchParam);
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
	public ModelAndView searchTheme(
			ModelAndView mav, 
			@RequestParam(required = false) String themaEnvrnCl) throws Exception {
		try {
			List<CampsiteExt> list;
			
			Map<String, Object> searchParam = new HashMap<>();
			searchParam.put("themaEnvrnCl", themaEnvrnCl);
			
			if(themaEnvrnCl == null) {
				list = campsiteService.recentCampsiteList();
			}
			else {
				list = campsiteService.searchCampsiteThemeList(searchParam);
			}
			mav.addObject("list", list);
			mav.setViewName("campsite/searchTheme");
		} catch (Exception e) {
			log.error("캠핑장 목록 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/infoView")
	public ModelAndView infoView(ModelAndView mav, @RequestParam long contentId) throws Exception {
		try {
			CampsiteExt campsite = campsiteService.selectOneCampsite(contentId);
			CampsiteFacility facility = campsiteService.selectOneCampsiteFacility(contentId);
			List<CampsiteImage> campsiteImageList = campsiteService.selectCampsiteImageListByContentId(contentId);
			mav.addObject("campsite", campsite);
			mav.addObject("facility", facility);
			mav.addObject("campsiteImageList", campsiteImageList);
			mav.setViewName("campsite/infoView");
		} catch (Exception e) {
			log.error("캠핑장 상세 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
	/*----- JH -----*/
	@GetMapping("/searchCampsiteIndex")
	public ModelAndView searchDetailTheme(
			ModelAndView mav, 
			@RequestParam(required = false) String sido,
			@RequestParam(required = false) String gugun,
			@RequestParam(required = false) String themaEnvrnCl,
			@RequestParam(required = false) String facltNm,
			@RequestParam(required = false) String induty) {
		
		try {
			Map<String, Object> searchParam = new HashMap<>();
			searchParam.put("sido", sido);
			searchParam.put("gugun", gugun);
			searchParam.put("themaEnvrnCl", themaEnvrnCl);
			searchParam.put("facltNm", facltNm);
			searchParam.put("induty", induty);
			List<CampsiteExt> list = campsiteService.searchCampsiteList(searchParam);
			mav.addObject("list", list);
			mav.setViewName("campsite/searchDetail");
		} catch(Exception e) {
			log.error("메인페이지 캠핑장 검색 오류", e);
			throw e;
		}
		return mav;
	}
	/*----- JH -----*/
}
