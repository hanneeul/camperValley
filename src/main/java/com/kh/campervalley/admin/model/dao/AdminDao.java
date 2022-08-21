package com.kh.campervalley.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.campervalley.cs.model.dto.NoticeExt;
import com.kh.campervalley.member.model.dto.Member;

@Mapper
public interface AdminDao {

	List<Member> selectMemberList(Map<String, Object> map, RowBounds rowBounds);

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

	int deleteMemberRole(Map<String, Object> map);

	int insertAuthority(Map<String, Object> map);

	int deleteBlack(Map<String, Object> map);

	int insertBlack(Map<String, Object> map);

	int selectTotalMemberList(Map<String, Object> map);

	@Select("select count(*) from camper where created_at >= TO_CHAR(sysdate -7, 'yyyy-mm-dd')")
	int todayCamper();

	@Select("select count(*) from campsite_review where created_at >= TO_CHAR(sysdate -7, 'yyyy-mm-dd')")
	int todayReview();

	@Select("select count(*) from used_product where product_enroll_time >= TO_CHAR(sysdate -7, 'yyyy-mm-dd')")
	int todayProduct();

	@Select("select count(*) from member where enroll_date >= TO_CHAR(LOCALTIMESTAMP, 'yyyy-mm-dd')")
	int sysdate();

	@Select("select count(*) from member where to_date(enroll_date, 'yyyy-mm-dd') between to_date(LOCALTIMESTAMP -1, 'yyyy-mm-dd') and to_date(LOCALTIMESTAMP -1, 'yyyy-mm-dd')")
	int minus1();
	
	@Select("select count(*) from member where to_date(enroll_date, 'yyyy-mm-dd') between to_date(LOCALTIMESTAMP -2, 'yyyy-mm-dd') and to_date(LOCALTIMESTAMP -2, 'yyyy-mm-dd')")
	int minus2();
	
	@Select("select count(*) from member where to_date(enroll_date, 'yyyy-mm-dd') between to_date(LOCALTIMESTAMP -3, 'yyyy-mm-dd') and to_date(LOCALTIMESTAMP -3, 'yyyy-mm-dd')")
	int minus3();
	
	@Select("select count(*) from member where to_date(enroll_date, 'yyyy-mm-dd') between to_date(LOCALTIMESTAMP -4, 'yyyy-mm-dd') and to_date(LOCALTIMESTAMP -4, 'yyyy-mm-dd')")
	int minus4();
	
	@Select("select count(*) from member where to_date(enroll_date, 'yyyy-mm-dd') between to_date(LOCALTIMESTAMP -5, 'yyyy-mm-dd') and to_date(LOCALTIMESTAMP -5, 'yyyy-mm-dd')")
	int minus5();

	@Select("select count(*) from member where to_date(enroll_date, 'yyyy-mm-dd') between to_date(LOCALTIMESTAMP -6, 'yyyy-mm-dd') and to_date(LOCALTIMESTAMP -6, 'yyyy-mm-dd')")
	int minus6();

	@Select("select * from (select * from notice order by created_at desc) where rownum <= 3")
	List<NoticeExt> selectNoticeList();
	
	


}
