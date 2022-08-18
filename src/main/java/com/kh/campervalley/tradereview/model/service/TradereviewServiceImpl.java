package com.kh.campervalley.tradereview.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.campervalley.tradereview.model.dao.TradereviewDao;
import com.kh.campervalley.tradereview.model.dto.TradeReview;
import com.kh.campervalley.tradereview.model.dto.TradeReviewExt;

@Service
public class TradereviewServiceImpl implements TradereviewService {

	@Autowired
	private TradereviewDao tradereviewDao;

	@Override
	public int insertReview(TradeReview tradeReview) {
		return tradereviewDao.insertReview(tradeReview);
	}

	@Override
	public int deleteReview(int reviewNo) {
		return tradereviewDao.deleteReview(reviewNo);
	}

	@Override
	public int updateReview(TradeReview tradeReview) {
		return tradereviewDao.updateReview(tradeReview);
	}

	@Override
	public Map<String, Object> selectCounts(String memberId) {
		return tradereviewDao.selectCounts(memberId);
	}

	@Override
	public List<TradeReviewExt> selectReviewList(int cPage, int numPerPage, String memberId) {
		return tradereviewDao.selectReviewList(memberId);
	} 
}
