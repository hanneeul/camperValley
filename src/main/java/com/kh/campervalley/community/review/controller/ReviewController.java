package com.kh.campervalley.community.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.community.review.model.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/community/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/reviewList")
	public void reviewList() {}
	
	@GetMapping("/reviewEnroll")
	public void reviewEnroll() {}
	
	@GetMapping("/reviewUpdate")
	public void reviewUpdate() {}
	
	@GetMapping("/reviewDetail")
	public void reviewDetail() {}
	
}
