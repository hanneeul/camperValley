package com.kh.campervalley.cs.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.campervalley.cs.model.dao.CsDao;
import com.kh.campervalley.cs.model.dto.Notice;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CsServiceImpl implements CsService {
	
	@Autowired
	private CsDao csDao;
	
	@Override
	public List<Notice> selectFaqList() {
		return csDao.selectFaqList();
	}

}
