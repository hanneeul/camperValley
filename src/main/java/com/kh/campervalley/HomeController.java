package com.kh.campervalley;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.mypage.advertiser.model.dto.AdvertisementExt;
import com.kh.campervalley.mypage.advertiser.model.service.AdvertiserService;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	private AdvertiserService advertiserService;
	
	@GetMapping("/")
	public ModelAndView index(ModelAndView mav) {
		log.debug("GET / 요청!");
		Map<String, Object> param = new HashMap<>();
		try {
			param.put("topN", 3);
			param.put("adZone", "mainHome");
			List<AdvertisementExt> adList = advertiserService.selectDisplayAd(param);
			log.debug("adList = {}", adList);

			mav.addObject("adList", adList);
			mav.setViewName("index");
		} catch(Exception e) {
			log.error("홈페이지 로드 오류", e);
			throw e;
		}
		return mav;
	}
	
}
