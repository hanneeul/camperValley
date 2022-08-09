package com.kh.campervalley.cs.model.service;

import java.util.List;

import com.kh.campervalley.cs.model.dto.Notice;

public interface CsService {

	List<Notice> selectFaqList();

	int faqDelete(int noticeNo);

	Notice selectOneFaq(int noticeNo);

	int faqUpdate(Notice notice);

	int faqInsert(Notice notice);

}
