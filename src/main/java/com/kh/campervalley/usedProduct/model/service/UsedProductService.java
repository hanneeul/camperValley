package com.kh.campervalley.usedProduct.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.usedProduct.model.dto.ProductCategory;
import com.kh.campervalley.usedProduct.model.dto.UsedProduct;
import com.kh.campervalley.usedProduct.model.dto.WishProduct;

public interface UsedProductService {

	public int productInsert(UsedProduct usedProduct); // 상품 등록

	public int getProductNo(); // 상품 번호

	public List<UsedProduct> getProductList(int page); // 전체 상품 목록

	public void cateProductList(String cateNo, int page, String order, ModelAndView mav); // 카테고리

	public List<ProductCategory> cateList();

	public void viewUpdate(String no);

	public UsedProduct productDetail(String no);

	public UsedProduct saveHeart(WishProduct wishProduct, String productNo);

	public UsedProduct removeHeart(WishProduct wishProduct, String productNo);

	public WishProduct findHeart(Map<String, Object> map);

	public int productDelete(int productNo) throws Exception;

	public void searchProductList(String keyword, int page, String order, Model model);


}