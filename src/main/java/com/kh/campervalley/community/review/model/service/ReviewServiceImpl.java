package com.kh.campervalley.community.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.campervalley.community.review.model.dao.ReviewDao;
import com.kh.campervalley.community.review.model.dto.CampsiteReviewExt;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public int insertReview(CampsiteReviewExt review) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
