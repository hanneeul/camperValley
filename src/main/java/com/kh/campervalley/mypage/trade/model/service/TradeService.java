package com.kh.campervalley.mypage.trade.model.service;

import java.util.List;
import java.util.Map;

import com.kh.campervalley.usedProduct.model.dto.UsedProduct;

import lombok.NonNull;

public interface TradeService {
	
	public static final int TRADE_NUM_PER_REQUEST= 7;
	
	List<UsedProduct> sellingListByMemberId(Map<String, Object> map);

	List<UsedProduct> purchasedListByMemberId(Map<String, Object> map);

	List<UsedProduct> selectMoreSalesProduct(int cPage, int numPerReq, @NonNull String memberId);


}
