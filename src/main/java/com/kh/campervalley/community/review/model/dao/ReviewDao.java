package com.kh.campervalley.community.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.campervalley.community.review.model.dto.CampsiteReviewExt;
import com.kh.campervalley.community.review.model.dto.ReviewPhoto;

@Mapper
public interface ReviewDao {
	
	List<Map<String, Object>> autoComplete(Map<String, Object> paramMap);

	int insertReview(CampsiteReviewExt review);

	int insertReviewPhoto(ReviewPhoto photo);

}
