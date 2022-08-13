package com.kh.campervalley.community.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.campervalley.community.review.model.dto.CampsiteReview;
import com.kh.campervalley.community.review.model.dto.CampsiteReviewExt;
import com.kh.campervalley.community.review.model.dto.ReviewPhoto;

@Mapper
public interface ReviewDao {
	
	List<Map<String, Object>> autoComplete(Map<String, Object> paramMap);

	int insertReview(CampsiteReviewExt review);

	int insertReviewPhoto(ReviewPhoto photo);

	List<CampsiteReview> selectReviewList(RowBounds rowBounds);

	@Select("select count(*) from campsite_review")
	int selectTotalReview();

	List<CampsiteReview> searchReviewList(Map<String, Object> searchParam, RowBounds rowBounds);

	int searchTotalReview(Map<String, Object> searchParam);

}
