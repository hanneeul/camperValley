package com.kh.campervalley.community.camper.model.service;

import java.util.List;

import com.kh.campervalley.community.camper.model.dto.Camper;

public interface CamperService {

	int insertCamper(Camper camper);

	List<Camper> selectCamperList();
	
}
