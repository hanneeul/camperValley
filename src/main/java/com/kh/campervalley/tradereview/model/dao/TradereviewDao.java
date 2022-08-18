package com.kh.campervalley.tradereview.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import com.kh.campervalley.tradereview.model.dto.TradeReview;
import com.kh.campervalley.tradereview.model.dto.TradeReviewExt;

@Mapper
public interface TradereviewDao {

	int insertReview(TradeReview tradeReview);

	@Delete("delete from trade_review where review_no = #{reviewNo}")
	int deleteReview(int reviewNo);

	int updateReview(TradeReview tradeReview);

	Map<String, Object> selectCounts(String memberId);

	List<TradeReviewExt> selectReviewList(String memberId);

}
