package com.kh.campervalley.community.review.model.service;

import java.util.List;
import java.util.Map;

import com.kh.campervalley.community.review.model.dto.CampsiteReview;
import com.kh.campervalley.community.review.model.dto.CampsiteReviewExt;

public interface ReviewService {
	
	public final static int REVIEW_NUM_PER_PAGE = 10;

	List<Map<String, Object>> autoComplete(Map<String, Object> param);

	int insertReview(CampsiteReviewExt review);

	List<CampsiteReview> selectReviewList(int cPage, int numPerPage);

	int selectTotalReview();

	List<CampsiteReview> searchReviewList(Map<String, Object> searchParam, int cPage, int numPerPage);

	int searchTotalReview(Map<String, Object> searchParam);

}
