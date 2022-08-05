package com.kh.campervalley.mypage.advertiser.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AdvertiserDao {

	@Select("select 10+100 from dual")
	int test();
	
}
