package com.kh.campervalley.mypage.trade.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.campervalley.mypage.trade.dto.WishExt;
import com.kh.campervalley.usedProduct.model.dto.UsedProduct;

import lombok.NonNull;

@Mapper
public interface TradeDao {

	List<UsedProduct> sellingListByMemberId(Map<String, Object> map);

	List<UsedProduct> purchasedListByMemberId(Map<String, Object> map);

	List<UsedProduct> selectMoreSellingProduct(String memberId, RowBounds rowBounds);

	List<WishExt> wishListByMemberId(Map<String, Object> map);

	int wishDelete(int wishNo);

	List<WishExt> selectMoreWishProduct(@NonNull String memberId, RowBounds rowBounds);

	List<UsedProduct> soldListByMemberId(Map<String, Object> map);

	List<UsedProduct> selectMoreSoldProduct(@NonNull String memberId, RowBounds rowBounds);
	
}
