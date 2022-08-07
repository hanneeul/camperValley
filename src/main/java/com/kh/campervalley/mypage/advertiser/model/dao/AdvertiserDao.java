package com.kh.campervalley.mypage.advertiser.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserExt;
import com.kh.campervalley.mypage.advertiser.model.dto.LicenseFile;

@Mapper
public interface AdvertiserDao {

	int insertAdvertiser(AdvertiserExt advertiser);

	@Insert("insert into license_file values (seq_license_file_no.nextval, #{advertiserNo}, #{originalFilename}, #{renamedFilename}, default)")
	int insertLicenseFile(LicenseFile licenseFile);
	
}
