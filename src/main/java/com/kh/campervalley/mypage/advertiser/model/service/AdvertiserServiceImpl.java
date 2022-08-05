package com.kh.campervalley.mypage.advertiser.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.campervalley.mypage.advertiser.model.dao.AdvertiserDao;

@Service
public class AdvertiserServiceImpl implements AdvertiserService {

	@Autowired
	AdvertiserDao advertiserDao;
	
	@Override
	public int test() {
		return advertiserDao.test();
	}

}
