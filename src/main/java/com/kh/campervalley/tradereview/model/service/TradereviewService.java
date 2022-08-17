package com.kh.campervalley.tradereview.model.service;

import com.kh.campervalley.tradereview.model.dto.TradeReview;

public interface TradereviewService {

	int insertReview(TradeReview tradeReview);

	int deleteReview(int reviewNo);

	int updateReview(TradeReview tradeReview);

}
