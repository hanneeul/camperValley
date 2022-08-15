package com.kh.campervalley.usedProduct.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.usedProduct.model.dao.UsedProductDao;
import com.kh.campervalley.usedProduct.model.dto.ProductCategory;
import com.kh.campervalley.usedProduct.model.dto.UsedProduct;
import com.kh.campervalley.usedProduct.model.dto.WishProduct;

@Service
public class UsedProductServiceImpl implements UsedProductService {

	@Autowired
	private UsedProductDao usedProductDao;
	
	@Override
	public int productInsert(UsedProduct usedProduct) {
		return usedProductDao.productInsert(usedProduct);
	}

	@Override
	public int getProductNo() {
		return usedProductDao.getProductNo();
	}

	@Override
	public List<UsedProduct> getProductList(int page) {
		
		Map<String, Object> param = new HashMap<>();
		int start;
		int end;
		int default_count = 10;
		int pageSize = 10;
		
		if(page > 0) {
			start = default_count + 1 + (page - 1) * pageSize;
			end = default_count + page * pageSize;
			param.put("start", start);
			param.put("end", end);
			
			System.out.println("start = " + start);
			System.out.println("end = " + end);
		}
		return usedProductDao.getProductList(param);
	}

	@Override
	public void cateProductList(String cateNo, int page, String order, ModelAndView mav) {
		
		Map<String, Object> map = new HashMap<>();
		
		int pageSize = 20;
		if(page == 0) {
			page = 1;
		}
		
		int start = (page - 1) * pageSize;
		int end = (page) * pageSize;
		
		String cateName = usedProductDao.cateName(cateNo);
	
		
		
		map.put("start", start);
		map.put("end", end);
		map.put("order", order);
		map.put("cateNo", Integer.parseInt(cateNo));
		
		// 목록 조회
		List<UsedProduct> list = usedProductDao.cateProductList(map);
		// 개수 조회
		int cnt = usedProductDao.cateProductCount(map);

		mav.addObject("cateName", cateName);
		mav.addObject("cateNo", cateNo);
		mav.addObject("list", list);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("cnt", cnt);
		mav.addObject("page", page);
		mav.addObject("order", order);
	}

	@Override
	public List<ProductCategory> cateList() {
		return usedProductDao.cateList();
	}

	@Override
	public void viewUpdate(String no) {
		usedProductDao.viewUpdate(no);
	}

	@Override
	public UsedProduct productDetail(String no) {
		return usedProductDao.productDetail(no);
	}

	@Override
	public UsedProduct saveHeart(WishProduct wishProduct, String productNo) {
		UsedProduct usedProduct = new UsedProduct();
		usedProduct.setProductNo(wishProduct.getProductNo());
		
		// 해당 게시글 heart +1
		usedProductDao.updateUpHeart(usedProduct);
		
		// wishProduct테이블에 추가
		int result = usedProductDao.insertHeart(wishProduct);
		
		if (result == 1) {
			// 갱신된 하트 갯스 가져오기
			usedProduct = usedProductDao.getHeartCount(usedProduct);
		}
		return usedProduct;
	}

	@Override
	public UsedProduct removeHeart(WishProduct wishProduct, String productNo) {
		UsedProduct usedProduct = new UsedProduct();
		usedProduct.setProductNo(wishProduct.getProductNo());
		
		// 해당 게시글 heart -1
		usedProductDao.updateDownHeart(usedProduct);
		
		// wishProduct테이블에 추가
		int result = usedProductDao.deleteHeart(wishProduct);
		
		if (result == 1) {
			// 갱신된 하트 갯스 가져오기
			usedProduct = usedProductDao.getHeartCount(usedProduct);
		}
		return usedProduct;
	}

}
