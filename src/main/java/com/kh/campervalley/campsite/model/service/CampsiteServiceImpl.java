package com.kh.campervalley.campsite.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.campervalley.campsite.model.dao.CampsiteDao;

@Service
public class CampsiteServiceImpl implements CampsiteService {

	// @Autowired
	private CampsiteDao campsiteDao;
	
}
