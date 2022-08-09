package com.kh.campervalley.usedProduct.model.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.campervalley.usedProduct.model.dto.UsedProduct;

@Mapper
public interface UsedProductDao {

	int productInsert(UsedProduct usedProduct);

	int getProductNo();;
}
