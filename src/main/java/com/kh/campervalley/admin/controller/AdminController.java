package com.kh.campervalley.admin.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.common.CamperValleyUtils;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserExt;
import com.kh.campervalley.mypage.advertiser.model.dto.LicenseFile;
import com.kh.campervalley.mypage.advertiser.model.service.AdvertiserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {
	
	@GetMapping("/dashboard")
	public void dashboard() {}

	@GetMapping("/memberList")
	public void memberList() {}
	
	// --------------------- EJ start
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@Autowired
	private AdvertiserService advertiserService;
	
	@GetMapping("/advertiser")
	public ModelAndView advertiser(@RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request) {
		try {
			int numPerPage = AdvertiserService.ADVERTISER_NUM_PER_PAGE;
			List<AdvertiserExt> list = advertiserService.selectAdvertiserList(cPage, numPerPage);
			log.debug("list = {}", list);
			mav.addObject("list", list);

			int totalAdvertiser = advertiserService.selectTotalAdvertiser();
			String url = request.getRequestURI();
			String pagebar = CamperValleyUtils.getPagebar(cPage, numPerPage, totalAdvertiser, url);
			mav.addObject("pagebar", pagebar);
			mav.setViewName("admin/advertiser");
		} catch (Exception e) {
			log.error("광고주목록 조회 오류", e);
			throw e;
		}
		return mav;
	}
	
	@GetMapping("/advertiser/fileDownload")
	@ResponseBody
	public Resource licenseFileDownload(@RequestParam int no, HttpServletResponse response) throws Exception {
		Resource resource = null;
		try {
			LicenseFile license = advertiserService.selectOneLicenseFile(no);

			String saveDirectory = application.getRealPath("/resources/upload/mypage/advertiser/license");
			File downFile = new File(saveDirectory, license.getRenamedFilename());

			String location = "file:" + downFile;
			resource = resourceLoader.getResource(location);

			String filename = URLEncoder.encode(license.getOriginalFilename(), "utf-8");
			response.addHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + filename + "\"");

		} catch (Exception e) {
			log.error("사업자등록증 다운로드 오류", e);
			throw e;
		}
		return resource;
	}
	// --------------------- EJ end

	@GetMapping("/camperManagement")
	public void camperManagement() {}

	@GetMapping("/usedProductManagement")
	public void usedProductManagement() {}

	@GetMapping("/reportManagement")
	public void reportManagement() {}

}
