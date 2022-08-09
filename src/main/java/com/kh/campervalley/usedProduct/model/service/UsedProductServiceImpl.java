package com.kh.campervalley.usedProduct.model.service;

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

}
