package com.kh.campervalley.cs.model.service;

import java.util.List;
import java.util.Map;

import com.kh.campervalley.cs.model.dto.Notice;

public interface CsService {

	List<Notice> selectFaqList(Map<String, Object> map);

	int faqDelete(int noticeNo);

	Notice selectOneFaq(int noticeNo);

	int faqUpdate(Notice notice);

	int faqInsert(Notice notice);

	int selectTotalFaqList(Map<String, Object> map);

}
