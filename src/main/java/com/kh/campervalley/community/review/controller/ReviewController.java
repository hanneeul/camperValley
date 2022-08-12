package com.kh.campervalley.community.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.campervalley.common.CamperValleyUtils;
import com.kh.campervalley.community.review.model.dto.CampsiteReviewExt;
import com.kh.campervalley.community.review.model.dto.ReviewPhoto;
import com.kh.campervalley.community.review.model.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/community/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	ServletContext application;
	
	@GetMapping("/reviewList")
	public void reviewList() {}
	
	@GetMapping("/reviewEnroll")
	public void reviewEnroll() {}
	
	@PostMapping("/reviewEnroll")
	public String reviewEnroll(
			@ModelAttribute CampsiteReviewExt review, 
			@RequestParam("upFile") MultipartFile[] upFiles, 
			RedirectAttributes redirectAttr) throws Exception {
		try {
			String saveDirectory = application.getRealPath("/resources/upload/campsite/review");
			
			for(MultipartFile upFile : upFiles) {
				
				if(upFile.getSize() > 0) {
					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = CamperValleyUtils.getRenamedFilename(originalFilename);
					
					File destFile = new File(saveDirectory, renamedFilename);
					upFile.transferTo(destFile);
					
					ReviewPhoto photo = new ReviewPhoto();
					photo.setOriginalFilename(originalFilename);
					photo.setRenamedFilename(renamedFilename);
					review.addReviewPhoto(photo);
				}
			}
			
			int result = reviewService.insertReview(review);
			redirectAttr.addFlashAttribute("msg", "리뷰를 성공적으로 등록했습니다.");
			
		} catch (IOException e) {
			log.error("첨부파일 등록 오류", e);
			throw e;
		} catch (Exception e) {
			log.error("리뷰 등록 오류", e);
			throw e;
		}
		return "redirect:/community/review/reviewDetail.do?reviewNo=" + review.getReviewNo();
	}
		
	@PostMapping("/autoComplete")
	public @ResponseBody Map<String, Object> autoComplete(
			@RequestParam Map<String, Object> paramMap) throws Exception {
		List<Map<String, Object>> resultList = reviewService.autoComplete(paramMap);
		log.debug("resultList = {}", resultList);
		paramMap.put("resultList", resultList);
		return paramMap;
	}
	
	@GetMapping("/reviewUpdate")
	public void reviewUpdate() {}
	
	@GetMapping("/reviewDetail")
	public void reviewDetail() {}
	
}
