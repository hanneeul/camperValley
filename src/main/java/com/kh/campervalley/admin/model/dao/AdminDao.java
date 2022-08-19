package com.kh.campervalley.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.campervalley.cs.model.dto.NoticeExt;
import com.kh.campervalley.member.model.dto.Member;

@Mapper
public interface AdminDao {

	List<Member> selectMemberList();

	Member selectOneMember(String memberId);

	int memberUpdate(Member memberId);

	List<NoticeExt> selectProductList(Map<String, Object> map, RowBounds rowBounds);

	int selectTotalProductList(Map<String, Object> map);

	int productDelete(Integer productNo);

	int camperDelete(Integer camperNo);

	List<NoticeExt> selectCamperList(Map<String, Object> map, RowBounds rowBounds);

	int selectTotalCamperList(Map<String, Object> map);

	int reviewDelete(Integer reviewNo);

	List<NoticeExt> selectReviewList(Map<String, Object> map, RowBounds rowBounds);

	int selectTotalReviewList(Map<String, Object> map);


}
