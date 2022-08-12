package com.kh.campervalley.community.camper.model.service;

import java.util.List;

import com.kh.campervalley.community.camper.model.dto.Camper;

public interface CamperService {

	public static final int CAMPER_NUM_PER_PAGE = 5;
	
	int insertCamper(Camper camper);

	List<Camper> selectCamperList(int numPerPage);

	List<Camper> selectMoreCamperList(int cPage, int numPerPage);
	
}
