package com.kh.campervalley.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.campervalley.admin.model.dao.AdminDao;
import com.kh.campervalley.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public List<Member> selectMemberList() {
		return adminDao.selectMemberList();
	}
	
	@Override
	public Member selectOneMember(String memberId) {
		return adminDao.selectOneMember(memberId);
	}
	
	@Override
	public int memberUpdate(String memberId) {
		// TODO Auto-generated method stub
		return adminDao.memberUpdate(memberId);
	}
	

}
