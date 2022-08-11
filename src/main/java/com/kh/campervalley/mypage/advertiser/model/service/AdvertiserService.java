package com.kh.campervalley.mypage.advertiser.model.service;

import java.util.List;
import java.util.Map;

import com.kh.campervalley.mypage.advertiser.model.dto.Admoney;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserExt;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserMoneyExt;
import com.kh.campervalley.mypage.advertiser.model.dto.LicenseFile;
import com.kh.campervalley.mypage.advertiser.model.dto.Pay;

public interface AdvertiserService {
	
	public static final int ADVERTISER_NUM_PER_PAGE = 15;

	int insertAdvertiser(AdvertiserExt advertiser);

	List<AdvertiserExt> selectAdvertiserList(int cPage, int numPerPage);

	List<AdvertiserExt> selectAdvertiserFilteredList(Map<String, Object> param, int cPage, int numPerPage);

	int selectTotalAdvertiser();

	int selectFilteredTotalAdvertiser(Map<String, Object> param);

	LicenseFile selectOneLicenseFile(int no);

	int updateAdvertiserPermission(int advertiserNo, String memberId);

	int updateAdvertiserPause(int advertiserNo, String memberId);

	AdvertiserMoneyExt selectOneAdvertiserMoney(String memberId);

	Admoney selectOneAdmoney(int advertiserNo);

	List<Pay> selectNotCancelPayByAdvertiserNo(int advertiserNo);

	int chargeAdmoney(Pay pay);

}
