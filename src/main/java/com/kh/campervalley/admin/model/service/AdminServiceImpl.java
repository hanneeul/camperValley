package com.kh.campervalley.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.campervalley.admin.model.dao.AdminDao;
import com.kh.campervalley.cs.model.dto.NoticeExt;
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
	public int memberUpdate(Member memberId) {
		// TODO Auto-generated method stub
		return adminDao.memberUpdate(memberId);
	}
	
	@Override
	public List<NoticeExt> selectProductList(Map<String, Object> map) {
		int offset = (int)map.get("offset");
		int numPerPage = (int)map.get("numPerPage");
		RowBounds rowBounds = new RowBounds(offset, numPerPage);
		return adminDao.selectProductList(map, rowBounds);
	}
	
	@Override
	public int selectTotalProductList(Map<String, Object> map) {
		return adminDao.selectTotalProductList(map);
	}
	
	@Override
	public int productDelete(Integer productNo) {
		return (int) adminDao.productDelete(productNo);
	}
	
	@Override
	public List<NoticeExt> selectCamperList(Map<String, Object> map) {
		int offset = (int)map.get("offset");
		int numPerPage = (int)map.get("numPerPage");
		RowBounds rowBounds = new RowBounds(offset, numPerPage);
		return adminDao.selectCamperList(map, rowBounds);
	}
	
	@Override
	public int selectTotalCamperList(Map<String, Object> map) {
		return adminDao.selectTotalCamperList(map);
	}
	
	@Override
	public int camperDelete(Integer camperNo) {
		return (int) adminDao.camperDelete(camperNo);
	}
	
	@Override
	public int reviewDelete(Integer reviewNo) {
		return (int) adminDao.reviewDelete(reviewNo);
	}
	
	@Override
	public List<NoticeExt> selectReviewList(Map<String, Object> map) {
		int offset = (int)map.get("offset");
		int numPerPage = (int)map.get("numPerPage");
		RowBounds rowBounds = new RowBounds(offset, numPerPage);
		return adminDao.selectReviewList(map, rowBounds);
	}
	
	@Override
	public int selectTotalReviewList(Map<String, Object> map) {
		return adminDao.selectTotalReviewList(map);
	}
	

}
