package com.kh.campervalley.mypage.trade.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.campervalley.mypage.trade.model.dao.TradeDao;
import com.kh.campervalley.usedProduct.model.dto.UsedProduct;

import lombok.NonNull;

@Service
public class TradeServiceImpl implements TradeService {
	
	@Autowired
	TradeDao tradeDao;


	@Override
	public List<UsedProduct> sellingListByMemberId(Map<String, Object> map) {
		return tradeDao.sellingListByMemberId(map);
	}

	@Override
	public List<UsedProduct> purchasedListByMemberId(Map<String, Object> map) {
		return tradeDao.purchasedListByMemberId(map);
	}

	@Override
	public List<UsedProduct> selectMoreSalesProduct(int cPage, int numPerReq, @NonNull String memberId) {
		int offset = (cPage - 1) * numPerReq;
		RowBounds rowBounds = new RowBounds(offset, numPerReq);
		return tradeDao.selectMoreSalesProduct(memberId, rowBounds);
	}

	


}
