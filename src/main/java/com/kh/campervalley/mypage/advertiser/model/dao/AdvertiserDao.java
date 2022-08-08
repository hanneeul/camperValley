package com.kh.campervalley.mypage.advertiser.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserExt;
import com.kh.campervalley.mypage.advertiser.model.dto.LicenseFile;

@Mapper
public interface AdvertiserDao {

	int insertAdvertiser(AdvertiserExt advertiser);

	@Insert("insert into license_file values (seq_license_file_no.nextval, #{advertiserNo}, #{originalFilename}, #{renamedFilename}, default)")
	int insertLicenseFile(LicenseFile licenseFile);

	
	List<AdvertiserExt> selectAdvertiserList(RowBounds rowBounds);

	@Select("select count(*) from advertiser")
	int selectTotalAdvertiser();

	@Select("select * from license_file where license_file_no = #{no}")
	LicenseFile selectOneLicenseFile(int no);
	
}
