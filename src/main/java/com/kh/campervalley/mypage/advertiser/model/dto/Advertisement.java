package com.kh.campervalley.mypage.advertiser.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Advertisement {

	private int advertisementNo;
	private int advertiserNo;
	private String adName;
	private AdZone adZone;
	private String adLink;
	private int adCpc;
	private int adDailyBudget;
	private int adViewCnt;
	private int adClickCnt;
	private boolean adStatus;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;

}
