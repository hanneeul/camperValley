package com.kh.campervalley.tradereview.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.campervalley.tradereview.model.dto.TradeReview;

@Mapper
public interface TradereviewDao {

	int insertReview(TradeReview tradeReview);

}
