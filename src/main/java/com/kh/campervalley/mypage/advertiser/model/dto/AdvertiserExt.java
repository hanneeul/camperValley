package com.kh.campervalley.mypage.advertiser.model.dto;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class AdvertiserExt extends Advertiser {

	private LicenseFile licenseFile;

	public AdvertiserExt(int advertiserNo, String memberId, String bizLicenseNo, String bizName, BizStatus bizStatus,
			LocalDateTime createdAt, LocalDateTime deletedAt, @NonNull LicenseFile licenseFile) {
		
		super(advertiserNo, memberId, bizLicenseNo, bizName, bizStatus, createdAt, deletedAt);
		if(licenseFile != null)
			this.licenseFile = licenseFile;
	}

}
