package com.kh.campervalley.campsite.model.service;

import java.util.List;

import com.kh.campervalley.campsite.model.dto.CampsiteExt;

public interface CampsiteService {
	
	int insertCampsiteList(List<CampsiteExt> campsiteList);

	int campsiteListReset();

	List<CampsiteExt> recentCampsiteList();
	
	List<CampsiteExt> searchCampsiteByFacltNm(String facltNm);

}
