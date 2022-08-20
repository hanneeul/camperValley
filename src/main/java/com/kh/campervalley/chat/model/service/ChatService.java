package com.kh.campervalley.chat.model.service;

import java.util.List;
import java.util.Map;

import com.kh.campervalley.chat.model.dto.Chat;

public interface ChatService {

	List<Chat> getChatListByRecent(Map<String, Object> map);

	List<Chat> getChatListByNickname(Map<String, Object> map);

	int submit(Map<String, Object> map);


}
