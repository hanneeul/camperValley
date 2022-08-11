package com.kh.campervalley.community.camper.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.campervalley.community.camper.model.dao.CamperDao;
import com.kh.campervalley.community.camper.model.dto.Camper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CamperServiceImpl implements CamperService {

	@Autowired
	private CamperDao camperDao;

	@Override
	public int insertCamper(Camper camper) {
		return camperDao.insertCamper(camper);
	}

	@Override
	public List<Camper> selectCamperList() {
		return camperDao.selectCamperList();
	}
	
}
