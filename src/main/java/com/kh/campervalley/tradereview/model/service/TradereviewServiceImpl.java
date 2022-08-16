package com.kh.campervalley.tradereview.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.campervalley.tradereview.model.dao.TradereviewDao;
import com.kh.campervalley.tradereview.model.dto.TradeReview;

@Service
public class TradereviewServiceImpl implements TradereviewService {

	@Autowired
	private TradereviewDao tradereviewDao;

	@Override
	public int insertReview(TradeReview tradeReview) {
		return tradereviewDao.insertReview(tradeReview);
	} 
}
