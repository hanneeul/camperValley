package com.kh.campervalley.community.review.model.service;

import java.util.List;
import java.util.Map;

import com.kh.campervalley.community.review.model.dto.CampsiteReviewExt;

public interface ReviewService {

	List<Map<String, Object>> autoComplete(Map<String, Object> param);

	int insertReview(CampsiteReviewExt review);

}
