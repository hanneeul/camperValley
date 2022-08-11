package com.kh.campervalley.mypage.advertiser.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpEntity;
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
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
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
@PropertySource("classpath:datasource.properties")
@Slf4j
public class AdvertiserController {
	
	@Autowired
	private AdvertiserService advertiserService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@Value("${api.impRestKey}")
	private String IMP_REST_KEY;
	
	@Value("${api.impRestSecret}")
	private String IMP_SECRET_KEY;
	
	final String IMP_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	final String IMP_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	
	
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
		Map<String, Object> param = new HashMap<>();
		try {
			Admoney admoney = advertiserService.selectOneAdmoney(advertiserNo);
			
			param.put("advertiserNo",advertiserNo);
			param.put("maxCancelAmount", admoney.getBalance());
			List<Pay> canRefundList = advertiserService.selectNotCanceledPay(param);

			mav.addObject("admoney", admoney);
			mav.addObject("canRefundList", canRefundList);
		} catch (Exception e) {
			log.error("애드머니충전 페이지 요청 오류", e);
			throw e;
		}
		return mav;
	}
	
	@PostMapping("/admoneyCharge")
	public ResponseEntity<?> chargeAdmoney(Pay pay) {
		log.debug("pay = {}", pay);
		Admoney admoney = null;
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
	public ResponseEntity<?> refundAdmoney(@RequestParam(value="merchantUidList[]") List<String> merchantUidList, 
			@RequestParam(name="advertiserNo") int advertiserNo, String reason) throws Exception {
		log.debug("merchantUidList = {}", merchantUidList);
		log.debug("advertiserNo = {}", advertiserNo);
		log.debug("reason = {}", reason);
		Admoney admoney = null;
		int result = 0;
		try {
			List<Pay> payList = advertiserService.selectPayByMerchantUidList(merchantUidList);
			log.debug("payList = {}", payList);
			
			// 인증토큰발급
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", "application/json");

			Map<String, String> tokenParams = new HashMap<>();
			tokenParams.put("imp_key", IMP_REST_KEY);
			tokenParams.put("imp_secret", IMP_SECRET_KEY);
			String jsonTokenParams = new ObjectMapper().writeValueAsString(tokenParams); // json으로 변환

			RestTemplate restTemplate = new RestTemplate();
			HttpEntity<Map<String, String>> tokenRequest = new HttpEntity(jsonTokenParams, headers);
			Map<String, Object> responseToken = (Map<String, Object>) restTemplate
					.postForObject(IMP_TOKEN_URL, tokenRequest, Map.class).get("response");
			
			String ACCESS_TOKEN = (String) responseToken.get("access_token");

			// API서버 환불요청 및 DB업데이트
			headers.add("Authorization", ACCESS_TOKEN);
			for (int i = 0; i < payList.size(); i++) {
				Map<String, Object> params = new HashMap<>();
				params.put("reason", reason);
				params.put("imp_uid", payList.get(i).getImpUid());
				params.put("amount", payList.get(i).getPaidAmount());			
				String jsonParams = new ObjectMapper().writeValueAsString(params);
				
				HttpEntity<Map<String, String>> request = new HttpEntity(jsonParams, headers);
				Map<String, Object> response = restTemplate.postForObject(IMP_CANCEL_URL, request, Map.class);
				log.debug("Refund API response = {}", response);
				log.debug("Refund API response.code = {}", String.valueOf(response.get("code")).getClass().getName());
				
				// 정상환불 code = 0
				if(String.valueOf(response.get("code")).equals("0")) {
					result = advertiserService.refundAdmoney(payList.get(i));
				} else {
					String errorMID = payList.get(i).getMerchantUid();
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR) // 500
							.body(errorMID);
				}
			}
			admoney = advertiserService.selectOneAdmoney(advertiserNo);
			
		} catch(RestClientException e) {
			log.error("REST API 호출오류", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR) // 500
					.body(admoney);
		} catch(Exception e) {
			log.error("애드머니 환불처리 오류", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR) // 500
					.body(admoney);
		}
		return ResponseEntity.status(HttpStatus.OK).header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE).body(admoney);
	}
	
	@GetMapping("/enrollAd")
	public void enrollAd() { }
	
	@GetMapping("/sample")
	public void sample() { }

}
