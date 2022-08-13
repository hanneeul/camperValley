package com.kh.campervalley.mypage.advertiser.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.campervalley.mypage.advertiser.model.dao.AdvertiserDao;
import com.kh.campervalley.mypage.advertiser.model.dto.AdAttach;
import com.kh.campervalley.mypage.advertiser.model.dto.Admoney;
import com.kh.campervalley.mypage.advertiser.model.dto.Advertisement;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertisementExt;
import com.kh.campervalley.mypage.advertiser.model.dto.Advertiser;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserExt;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserMoneyExt;
import com.kh.campervalley.mypage.advertiser.model.dto.BizStatus;
import com.kh.campervalley.mypage.advertiser.model.dto.LicenseFile;
import com.kh.campervalley.mypage.advertiser.model.dto.Pay;

import lombok.NonNull;
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
		result = advertiserDao.insertAdmoney(advertiser.getAdvertiserNo());

		LicenseFile licenseFile = advertiser.getLicenseFile();
		licenseFile.setAdvertiserNo(advertiser.getAdvertiserNo());
		result = advertiserDao.insertLicenseFile(licenseFile);

		return result;
	}

	@Override
	public List<AdvertiserExt> selectAdvertiserList(int cPage, int numPerPage) {
		int offset = (cPage - 1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return advertiserDao.selectAdvertiserList(rowBounds);
	}

	@Override
	public List<AdvertiserExt> selectAdvertiserFilteredList(Map<String, Object> param, int cPage, int numPerPage) {
		int offset = (cPage - 1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return advertiserDao.selectAdvertiserFilteredList(param, rowBounds);
	}

	@Override
	public int selectTotalAdvertiser() {
		return advertiserDao.selectTotalAdvertiser();
	}

	@Override
	public int selectFilteredTotalAdvertiser(Map<String, Object> param) {
		return advertiserDao.selectFilteredTotalAdvertiser(param);
	}

	@Override
	public LicenseFile selectOneLicenseFile(int no) {
		return advertiserDao.selectOneLicenseFile(no);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateAdvertiserPermission(int advertiserNo, String memberId) {
		int result = advertiserDao.updateAdvertiserStatus(advertiserNo);

		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("auth", "ROLE_AD");
		result = advertiserDao.insertAuthority(map);

		return result;
	}

	@Override
	public int updateAdvertiserPause(int advertiserNo, String memberId) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("auth", "ROLE_AD");
		int result = advertiserDao.deleteAuthority(map);

		return result;
	}

	@Override
	public AdvertiserMoneyExt selectOneAdvertiserMoney(String memberId) {
		return advertiserDao.selectOneAdvertiserMoney(memberId);
	}

	@Override
	public Admoney selectOneAdmoney(int advertiserNo) {
		return advertiserDao.selectOneAdmoney(advertiserNo);
	}

	@Override
	public List<Pay> selectNotCanceledPay(Map<String, Object> param) {
		return advertiserDao.selectNotCanceledPay(param);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int chargeAdmoney(Pay pay) {
		int result = advertiserDao.insertPay(pay);
		result = advertiserDao.updateAdmoneyCharge(pay);
		return result;
	}

	@Override
	public List<Pay> selectPayByMerchantUidList(List<String> merchantUidList) {
		return advertiserDao.selectPayByMerchantUidList(merchantUidList);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int refundAdmoney(Pay pay) {
		int result = advertiserDao.updatePayRefund(pay.getMerchantUid());
		result = advertiserDao.updateAdmoneyRefund(pay);
		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertAdvertisement(AdvertisementExt advertisement) {
		int result = 0;
		Admoney admoney = advertiserDao.selectOneAdmoney(advertisement.getAdvertiserNo());
		if (admoney.getBalance() > advertisement.getAdCpc()) {
			// 잔여 애드머니가 cpc보다 많은경우 : on
			advertisement.setAdStatus(true);
		} else {
			// 잔여 애드머니가 cpc보다 적은경우 : off
			advertisement.setAdStatus(false);
		}
		result = advertiserDao.insertAdvertisement(advertisement);

		AdAttach adAttach = advertisement.getAdAttach();
		adAttach.setAdvertisementNo(advertisement.getAdvertisementNo());
		result = advertiserDao.insertAdAttach(adAttach);

		// 광고상태 on인경우 현재날짜 광고성과레코드 insert
		if (advertisement.isAdStatus()) {
			result = advertiserDao.insertAdPerformance(advertisement.getAdvertisementNo());
		}

		return result;
	}

	@Override
	public List<Advertisement> selectAdListByAdvertiserNo(int advertiserNo, int cPage, int numPerPage) {
		int offset = (cPage - 1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return advertiserDao.selectAdListByAdvertiserNo(advertiserNo, rowBounds);
	}

	@Override
	public int selectTotalAdvertisement(int advertiserNo) {
		return advertiserDao.selectTotalAdvertisement(advertiserNo);
	}

	@Override
	public int deleteAdvertisement(int advertisementNo) {
		return advertiserDao.updateDelAtAdvertisement(advertisementNo);
	}
	
	@Override
	public Advertiser selectAdvertiserByMemberId(@NonNull String memberId) {
		return advertiserDao.selectAdvertiserByMemberId(memberId);
	}

	@Override
	public boolean checkBalanceAndCpc(Advertisement advertisement, String memberId) {
		Advertiser advertiser = advertiserDao.selectAdvertiserByMemberId(memberId);
		advertisement.setAdvertiserNo(advertiser.getAdvertiserNo());

		int diff = advertiserDao.checkBalanceAndCpc(advertisement);
		log.debug("diff = {}", diff);
		boolean result;
		if (diff >= 0)
			result = true;
		else
			result = false;
		return result;
	}
}
