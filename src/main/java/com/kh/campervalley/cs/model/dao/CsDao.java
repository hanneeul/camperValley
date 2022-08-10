package com.kh.campervalley.cs.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.campervalley.cs.model.dto.Notice;
import com.kh.campervalley.cs.model.dto.NoticeAttach;
import com.kh.campervalley.cs.model.dto.NoticeExt;

@Mapper
public interface CsDao {

	List<Notice> selectFaqList(Map<String, Object> map, RowBounds rowBounds);

	int faqDelete(int noticeNo);

	Notice selectOneFaq(int noticeNo);

	int faqUpdate(Notice notice);

	int faqInsert(Notice notice);

	int selectTotalFaqList(Map<String, Object> map);

	List<NoticeExt> selectNoticeList();

	int noticeInsert(NoticeExt notice);

	int insertAttachment(NoticeAttach attach);

	NoticeExt selectOneNotice(int noticeNo);
	
}
