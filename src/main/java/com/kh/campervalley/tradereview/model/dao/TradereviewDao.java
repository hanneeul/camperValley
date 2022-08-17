package com.kh.campervalley.tradereview.model.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import com.kh.campervalley.tradereview.model.dto.TradeReview;

@Mapper
public interface TradereviewDao {

	int insertReview(TradeReview tradeReview);

	@Delete("delete from trade_review where review_no = #{reviewNo}")
	int deleteReview(int reviewNo);

	int updateReview(TradeReview tradeReview);

}
