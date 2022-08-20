package com.kh.campervalley.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import com.kh.campervalley.chat.model.dao.ChatDao;
import org.springframework.stereotype.Service;
import com.kh.campervalley.chat.model.dto.Chat;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatDao chatDao;

	@Override
	public List<Chat> getChatListByNickname(Map<String, Object> map) {
		return chatDao.getChatListByNickname(map);
	}

	@Override
	public List<Chat> getChatListByRecent(Map<String, Object> map) {
		return chatDao.getChatListByRecent(map);
	}

	@Override
	public int submit(Map<String, Object> map) {
		return chatDao.submit(map);
	}

}
