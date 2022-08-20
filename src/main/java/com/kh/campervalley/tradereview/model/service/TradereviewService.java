package com.kh.campervalley.tradereview.model.service;

import java.util.List;
import java.util.Map;

import com.kh.campervalley.tradereview.model.dto.TradeReview;
import com.kh.campervalley.tradereview.model.dto.TradeReviewExt;

public interface TradereviewService {

	int NUM_PER_PAGE = 5;
	
	int insertReview(TradeReview tradeReview);

	int deleteReview(int reviewNo);

	int updateReview(TradeReview tradeReview);

	Map<String, Object> selectCounts(String memberId);

	List<TradeReviewExt> selectReviewListByMemberId(int cPage, int numPerPage, String memberId);

	int selectTotalReviewByMemberId(String memberId);

}
