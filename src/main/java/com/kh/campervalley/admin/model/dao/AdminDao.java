package com.kh.campervalley.admin.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.campervalley.member.model.dto.Member;

@Mapper
public interface AdminDao {

	List<Member> selectMemberList();

	Member selectOneMember(String memberId);

	int memberUpdate(String memberId);


}
