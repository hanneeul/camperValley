package com.kh.campervalley.community.camper.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.campervalley.community.camper.model.dto.Camper;

@Mapper
public interface CamperDao {

	int insertCamper(Camper camper);

}
