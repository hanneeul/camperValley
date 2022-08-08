package com.kh.campervalley.cs.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.campervalley.cs.model.dto.Notice;

@Mapper
public interface CsDao {

	List<Notice> selectFaqList();

}
