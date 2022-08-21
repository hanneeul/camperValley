package com.kh.campervalley.member.model.service;

import java.util.Map;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.campervalley.member.model.dto.Member;

public interface MemberService{
	public static final String ROLE_USER = "ROLE_USER";
	public static final String ROLE_BLACK = "ROLE_BLACK";
	public static final String ROLE_ADMIN = "ROLE_ADMIN";
	int insertMember(Member member);
	Member selectOneMember(String attribute, String memberId);
	String selectIDByNameAndEmail(String name, String email);
	int updateMember(Member member);
	int updatePassword(Map<String, Object> map);
}
