package com.kh.campervalley.mypage.advertiser.model.common;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.campervalley.mypage.advertiser.model.service.AdvertiserService;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class AdvertiserSchedule {

	@Autowired
	private AdvertiserService advertiserService;

	@PostConstruct
	public void advertiserInit() {
		log.debug("[서버실행시 1회 실행]");
		dailyInsertPerformance();
	}

	@Scheduled(cron = "1 0 0 * * *", zone = "Asia/Seoul")
	public void dailyInsertPerformance() {
		log.debug("[매일 자정 실행] 운영중인 광고 일일성과 insert");
		List<Integer> advertisementNoList = advertiserService.selectAdvertisementForInsertPerform();
		log.debug("advertisementNoList = {}", advertisementNoList);

		if (advertisementNoList.size() > 0) {
			int result = advertiserService.dailyInsertPerformance(advertisementNoList);
		}
	}

}
