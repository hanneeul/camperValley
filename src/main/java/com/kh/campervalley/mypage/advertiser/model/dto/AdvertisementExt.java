package com.kh.campervalley.mypage.advertiser.model.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class AdvertisementExt extends Advertisement {

	private AdAttach adAttach;
	private List<AdPerformance> performanceList = new ArrayList<>();

	public AdvertisementExt(int advertisementNo, int advertiserNo, String adName, AdZone adZone, String adLink,
			int adCpc, int adDailyBudget, int adViewCnt, int adClickCnt, boolean adStatus, LocalDateTime createdAt,
			LocalDateTime updatedAt, LocalDateTime deletedAt, List<AdPerformance> performanceList) {
		super(advertisementNo, advertiserNo, adName, adZone, adLink, adCpc, adDailyBudget, adViewCnt, adClickCnt,
				adStatus, createdAt, updatedAt, deletedAt);
		this.performanceList = performanceList;
	}

	public void addAdPerformance(@NonNull AdPerformance adPerformance) {
		if (adPerformance != null)
			performanceList.add(adPerformance);
	}

}
