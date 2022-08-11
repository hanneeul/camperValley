package com.kh.campervalley.campsite.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.campervalley.campsite.model.dao.CampsiteDao;
import com.kh.campervalley.campsite.model.dto.CampsiteExt;
import com.kh.campervalley.campsite.model.dto.CampsiteFacility;

@Service
public class CampsiteServiceImpl implements CampsiteService {

	@Autowired
	private CampsiteDao campsiteDao;
	
//	@Transactional(rollbackFor = Exception.class)
//	@Override
//	public int insertCampsite(CampsiteExt campsite) {
//		int result = campsiteDao.insertCampsite(campsite);
//		CampsiteFacility campsiteFacility = campsite.getCampsiteFacility();
//		campsiteFacility.setContentId(campsite.getContentId());
//		result = campsiteDao.insertCampsiteFacility(campsiteFacility);
//		return result;
//	}
	
}
