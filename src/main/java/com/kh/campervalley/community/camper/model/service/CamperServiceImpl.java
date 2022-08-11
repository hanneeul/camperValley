package com.kh.campervalley.community.camper.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.campervalley.community.camper.model.dao.CamperDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CamperServiceImpl implements CamperService {

	@Autowired
	private CamperDao camperDao;
	
}
