package com.kh.campervalley.usedProduct.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.campervalley.usedProduct.model.dto.ProductCategory;
import com.kh.campervalley.usedProduct.model.dto.UsedProduct;

@Mapper
public interface UsedProductDao {

	int productInsert(UsedProduct usedProduct);

	int getProductNo();

	List<UsedProduct> getProductList(Map<String, Object> param);

	List<ProductCategory> cateList();

	List<UsedProduct> cateProductList(Map<String, Object> map);

	int cateProductCount(Map<String, Object> map);

	String cateName(String cateNo);

	void viewUpdate(String no);

	UsedProduct productDetail(String no);

}
