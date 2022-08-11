package com.kh.campervalley.member.model.service;

import com.kh.campervalley.member.model.dto.Member;

public interface MemberService{
	String ROLE_USER = "ROLE_USER";
	String ROLE_BLACK = "ROLE_BLACK";
	String ROLE_ADMIN = "ROLE_ADMIN";
	int insertMember(Member member);
	Member selectOneMember(String attribute, String memberId);
	String selectIDByNameAndEmail(String name, String email);
}
