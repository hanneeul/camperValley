package com.kh.campervalley.admin.model.service;

import java.util.List;

import com.kh.campervalley.member.model.dto.Member;

public interface AdminService {

	List<Member> selectMemberList();

	Member selectOneMember(String memberId);

	int memberUpdate(String memberId);




}
