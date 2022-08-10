package com.kh.campervalley.usedProduct.model.service;

import java.util.List;
import java.util.Map;

import com.kh.campervalley.usedProduct.model.dto.UsedProduct;

public interface UsedProductService {

	public void productInsert(UsedProduct usedProduct);

	public int getProductNo();

	public List<UsedProduct> getProductList(int page);

}
