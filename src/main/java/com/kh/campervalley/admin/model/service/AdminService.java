package com.kh.campervalley.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.campervalley.cs.model.dto.NoticeExt;
import com.kh.campervalley.member.model.dto.Member;

public interface AdminService {

	List<Member> selectMemberList();

	Member selectOneMember(String memberId);

	int memberUpdate(String memberId);

	List<NoticeExt> selectProductList(Map<String, Object> map);

	int selectTotalProductList(Map<String, Object> map);

	int productDelete(Integer productNo);

	int camperDelete(Integer camperNo);

	List<NoticeExt> selectCamperList(Map<String, Object> map);

	int selectTotalCamperList(Map<String, Object> map);

	int reviewDelete(Integer reviewNo);

	List<NoticeExt> selectReviewList(Map<String, Object> map);

	int selectTotalReviewList(Map<String, Object> map);




}
