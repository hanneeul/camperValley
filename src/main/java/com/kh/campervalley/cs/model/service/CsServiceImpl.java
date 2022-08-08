package com.kh.campervalley.cs.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.campervalley.cs.model.dao.CsDao;

@Service
public class CsServiceImpl implements CsService {
	
	@Autowired
	private CsDao csDao;

}
