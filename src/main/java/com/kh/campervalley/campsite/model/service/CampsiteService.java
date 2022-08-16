package com.kh.campervalley.campsite.model.service;

import java.util.List;

import com.kh.campervalley.campsite.model.dto.CampsiteExt;

public interface CampsiteService {
	
	int insertCampsiteList(List<CampsiteExt> campsiteList);

	List<CampsiteExt> recentCampsiteList();

	int campsiteListReset();

}
