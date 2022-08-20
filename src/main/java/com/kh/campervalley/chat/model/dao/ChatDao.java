package com.kh.campervalley.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.campervalley.chat.model.dto.Chat;

@Mapper
public interface ChatDao {

	List<Chat> getChatListByRecent(Map<String, Object> map);

	int submit(Map<String, Object> map);

	List<Chat> getChatListByNickname(Map<String, Object> map);
}
