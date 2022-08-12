package com.kh.campervalley.community.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.campervalley.community.review.model.dao.ReviewDao;
import com.kh.campervalley.community.review.model.dto.CampsiteReviewExt;
import com.kh.campervalley.community.review.model.dto.ReviewPhoto;

@Service
@Transactional(rollbackFor = Exception.class)
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public List<Map<String, Object>> autoComplete(Map<String, Object> paramMap) {
		return reviewDao.autoComplete(paramMap);
	}
	
	@Override
	public int insertReview(CampsiteReviewExt review) {
		int result = reviewDao.insertReview(review);
		
		List<ReviewPhoto> photos = review.getPhotos();
		if(!photos.isEmpty()) {
			for(ReviewPhoto photo : photos) {
				photo.setReviewNo(review.getReviewNo());
				result = reviewDao.insertReviewPhoto(photo);
			}
		}
		return result;
	}
	
}
