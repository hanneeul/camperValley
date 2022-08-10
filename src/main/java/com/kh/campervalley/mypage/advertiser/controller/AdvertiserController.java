package com.kh.campervalley.mypage.advertiser.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.common.CamperValleyUtils;
import com.kh.campervalley.member.model.dto.Member;
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
	public ModelAndView advertiserDashBoard(ModelAndView mav, @AuthenticationPrincipal Member loginMember) {
		String memberId = loginMember.getMemberId();
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
			// Member loginMember = memberService.selectMemberByMemberId();
			Admoney admoney = advertiserService.selectOneAdmoney(advertiserNo);
			List<Pay> payList = advertiserService.selectNotCancelPayByAdvertiserNo(advertiserNo);
			mav.addObject("admoney", admoney);
			mav.addObject("payList", payList);
		} catch (Exception e) {
			log.error("애드머니충전 페이지 요청 오류", e);
			throw e;
		}
		return mav;
	}
	
	@PostMapping("/admoneyCharge")
	public ResponseEntity<?> chargeAdmoney(Pay pay) {
		Admoney admoney = null;
		log.debug("pay = {}", pay);
		try {
			int result = advertiserService.chargeAdmoney(pay);
			admoney = advertiserService.selectOneAdmoney(pay.getAdvertiserNo());
		} catch (Exception e) {
			log.error("애드머니 충전내역 저장 오류", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR) // 500
					.body(admoney);
		}
		return ResponseEntity.status(HttpStatus.OK).header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE).body(admoney);
	};
	
	@ResponseBody
	@PostMapping("/refund")
	public ResponseEntity<?> refundAdmoney(@RequestParam(value="merchantUidList[]") List<String> merchantUidList, int advertiserNo, String reason) {
		log.debug("merchantUidList = {}", merchantUidList);
		log.debug("advertiserNo = {}", advertiserNo);
		log.debug("reason = {}", reason);
		Admoney admoney = null;
		try {
			
		} catch(Exception e) {
			log.error("애드머니 환불처리 오류", e);
			throw e;
		}
		return ResponseEntity.status(HttpStatus.OK).header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE).body(admoney);
	}
	
	@GetMapping("/enrollAd")
	public void enrollAd() { }
	
	@GetMapping("/sample")
	public void sample() { }

}
