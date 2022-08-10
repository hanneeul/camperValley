package com.kh.campervalley.mypage.advertiser.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.common.CamperValleyUtils;
import com.kh.campervalley.mypage.advertiser.model.dto.Admoney;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserExt;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserMoneyExt;
import com.kh.campervalley.mypage.advertiser.model.dto.LicenseFile;
import com.kh.campervalley.mypage.advertiser.model.dto.Pay;
import com.kh.campervalley.mypage.advertiser.model.service.AdvertiserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage/advertiser")
//@PropertySource("classpath:datasource.properties")
@Slf4j
public class AdvertiserController {
	
	@Autowired
	private AdvertiserService advertiserService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/register")
	public void registerAdvertiser() { }

	@PostMapping("/register")
	public String registerAdvertiser(AdvertiserExt advertiser, @RequestParam("adImg") MultipartFile upFile) {
		try {
			String saveDirectory = application.getRealPath("/resources/upload/mypage/advertiser/license");
			log.debug("saveDirectory = {}", saveDirectory);

			if (upFile.getSize() > 0) {
				String originalFilename = upFile.getOriginalFilename();
				String renamedFilename = CamperValleyUtils.getRenamedFilename(originalFilename);
				File destFile = new File(saveDirectory, renamedFilename);
				upFile.transferTo(destFile);

				LicenseFile licenseFile = new LicenseFile();
				licenseFile.setOriginalFilename(originalFilename);
				licenseFile.setRenamedFilename(renamedFilename);
				advertiser.setLicenseFile(licenseFile);
			}
			log.debug("advertiser = {}", advertiser);

			int result = advertiserService.insertAdvertiser(advertiser);

		} catch (IOException e) {
			log.error("사업자등록증파일 저장 오류", e);
		} catch (Exception e) {
			log.error("광고주등록 신청 오류", e);
			throw e;
		}

		return "redirect:/mypage/info/main";
	}
	
	@GetMapping("/exit")
	public void exitAdvertiser() { }
	
	@GetMapping("/dashboard")
	public ModelAndView advertiserDashBoard(ModelAndView mav) {
		// 매개변수 변경해야됨 @AuthenticationPrincipal Member loginMember
		String memberId = "honggd";
		try {
			// 광고주 계정 상태
			AdvertiserMoneyExt advertiser = advertiserService.selectOneAdvertiserMoney(memberId);
			log.debug("advertiser = {}", advertiser);

			// 운영광고목록

			mav.addObject("advertiser", advertiser);
		} catch (Exception e) {
			log.error("광고주 대시보드 조회 오류", e);
			throw e;
		}

		return mav;
	}
	
	@GetMapping("/admoney")
	public ModelAndView loadAdmoneyPage(@RequestParam("no") int advertiserNo, ModelAndView mav) {
		try {
			Admoney admoney = advertiserService.selectOneAdmoney(advertiserNo);
			log.debug("admoney = {}", admoney);
			mav.addObject("admoney", admoney);
		} catch(Exception e) {
			log.error("애드머니충전 페이지 요청 오류", e);
			throw e;
		}
		return mav;
	}
	
	@PostMapping("/admoneyCharge")
	public ResponseEntity<?> chargeAdmoney(Pay pay) {
		Map<String, Object> map = new HashMap<>();
		log.debug("pay = {}", pay);
		try {
			int result = advertiserService.chargeAdmoney(pay);
			
		} catch(Exception e) {
			log.error("애드머니 충전내역 저장 오류", e);
			map.put("msg", "애드머니 충전내역 저장 오류");
			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR) // 500
					.body(map);
		}
		return ResponseEntity.status(HttpStatus.OK).header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE).body(map);
	};
	
	@GetMapping("/enrollAd")
	public void enrollAd() { }
	
	@GetMapping("/sample")
	public void sample() { }

}
