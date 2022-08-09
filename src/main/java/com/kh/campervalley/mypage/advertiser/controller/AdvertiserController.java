package com.kh.campervalley.mypage.advertiser.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.common.CamperValleyUtils;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserExt;
import com.kh.campervalley.mypage.advertiser.model.dto.LicenseFile;
import com.kh.campervalley.mypage.advertiser.model.service.AdvertiserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage/advertiser")
@Slf4j
public class AdvertiserController {
	
	@Autowired
	private AdvertiserService advertiserService;
	
	@Autowired
	ServletContext application;
	
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
			
		} catch(Exception e) {
			log.error("광고주 대시보드 조회 오류", e);
			throw e;
		}
		
		return mav;
	}
	
	@GetMapping("/admoney")
	public void chargeAdmoney() { }
	
	@GetMapping("/enrollAd")
	public void enrollAd() { }
	
	@GetMapping("/sample")
	public void sample() { }

}
