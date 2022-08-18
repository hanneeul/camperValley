package com.kh.campervalley.campsite.model.service;

import java.util.List;
import java.util.Map;

import com.kh.campervalley.campsite.model.dto.CampsiteExt;

public interface CampsiteService {
	
	int insertCampsiteList(List<CampsiteExt> campsiteList);

	int campsiteListReset();

	List<CampsiteExt> recentCampsiteList();

	List<CampsiteExt> searchCampsiteList(Map<String, Object> searchParam);

	List<CampsiteExt> searchCampsiteThemeList(Map<String, Object> searchParam);

	CampsiteExt selectOneCampsite(long contentId);

}
