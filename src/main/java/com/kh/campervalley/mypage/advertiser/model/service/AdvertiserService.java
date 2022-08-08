package com.kh.campervalley.mypage.advertiser.model.service;

import java.util.List;

import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserExt;
import com.kh.campervalley.mypage.advertiser.model.dto.LicenseFile;

public interface AdvertiserService {
	
	public static final int ADVERTISER_NUM_PER_PAGE = 15;

	int insertAdvertiser(AdvertiserExt advertiser);

	List<AdvertiserExt> selectAdvertiserList(int cPage, int numPerPage);

	int selectTotalAdvertiser();

	LicenseFile selectOneLicenseFile(int no);

}
