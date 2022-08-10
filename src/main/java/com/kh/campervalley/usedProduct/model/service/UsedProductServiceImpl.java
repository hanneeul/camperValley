package com.kh.campervalley.usedProduct.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.campervalley.usedProduct.model.dao.UsedProductDao;
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

}
