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

@Service
public class UsedProductServiceImpl implements UsedProductService {

	@Autowired
	private UsedProductDao usedProductDao;
	
	@Override
	public void productInsert(UsedProduct usedProduct) {
		usedProductDao.productInsert(usedProduct);
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
		int default_count = 20;
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

}
