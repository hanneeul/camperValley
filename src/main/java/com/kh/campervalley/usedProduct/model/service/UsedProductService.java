package com.kh.campervalley.usedProduct.model.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.usedProduct.model.dto.ProductCategory;
import com.kh.campervalley.usedProduct.model.dto.UsedProduct;

public interface UsedProductService {

	public int productInsert(UsedProduct usedProduct); // 상품 등록

	public int getProductNo(); // 상품 번호

	public List<UsedProduct> getProductList(int page); // 전체 상품 목록

	public void cateProductList(String cateNo, int page, String order, ModelAndView mav); // 카테고리

	public List<ProductCategory> cateList();


}
