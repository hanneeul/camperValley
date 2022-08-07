package com.kh.campervalley.mypage.advertiser.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.campervalley.mypage.advertiser.model.dao.AdvertiserDao;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserExt;
import com.kh.campervalley.mypage.advertiser.model.dto.LicenseFile;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdvertiserServiceImpl implements AdvertiserService {

	@Autowired
	AdvertiserDao advertiserDao;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertAdvertiser(AdvertiserExt advertiser) {
		int result = advertiserDao.insertAdvertiser(advertiser);

		LicenseFile licenseFile = advertiser.getLicenseFile();
		licenseFile.setAdvertiserNo(advertiser.getAdvertiserNo());
		result = advertiserDao.insertLicenseFile(licenseFile);

		return result;
	}
}
