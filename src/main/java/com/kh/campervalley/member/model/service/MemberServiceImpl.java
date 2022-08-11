package com.kh.campervalley.member.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.campervalley.member.model.dao.MemberDao;
import com.kh.campervalley.member.model.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberDao;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertMember(Member member) {
		int result = memberDao.insertMember(member);
		Map<String, Object> map =  new HashMap<>();
		map.put("memberId", member.getMemberId());
		map.put("auth", MemberService.ROLE_USER);
		result = memberDao.insertAuthority(map);
		return result;
	}

	@Override
	public Member selectOneMember(String attribute, String memberId) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("attribute",  attribute);
		return memberDao.selectOneMember(map);
	}

	@Override
	public String selectIDByNameAndEmail(String name, String email) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);
		return memberDao.selectIDByNameAndEmail(map);
	}

	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}
}
