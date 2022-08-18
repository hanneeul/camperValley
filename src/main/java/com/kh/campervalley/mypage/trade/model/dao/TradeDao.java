package com.kh.campervalley.mypage.trade.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.campervalley.usedProduct.model.dto.UsedProduct;

import lombok.NonNull;

@Mapper
public interface TradeDao {

	List<UsedProduct> sellingListByMemberId(Map<String, Object> map);

	List<UsedProduct> purchasedListByMemberId(Map<String, Object> map);

	List<UsedProduct> selectMoreSalesProduct(@NonNull String memberId, RowBounds rowBounds);
	
}
