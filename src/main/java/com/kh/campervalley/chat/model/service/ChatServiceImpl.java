package com.kh.campervalley.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.campervalley.chat.model.dao.ChatDao;
import com.kh.campervalley.chat.model.dto.ChatLog;
import com.kh.campervalley.chat.model.dto.ChatMember;

@Transactional(rollbackFor = Exception.class)
@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatDao chatDao;

	@Override
	public ChatMember findChatMemberByMemberId(Map<String, Object> map) {
		return chatDao.findChatMemberByMemberId(map);
	}
//
	@Override
	public int insertChatLog(Map<String, Object> payload) {
		return chatDao.insertChatLog(payload);
	}

	@Override
	public List<ChatLog> findChatLogByChatroomId(String chatroomId) {
		return chatDao.findChatLogByChatroomId(chatroomId);
	}

	@Override
	public int createChatroom(Map<String, Object> map) {
		int result = 0;
		
		result = chatDao.insertChatMember(map);
		
		return result;
	}
	@Override
	public List<ChatLog> findRecentChatLogList(Map<String, Object> map) {
		return chatDao.findRecentChatLogList(map);
	}

}
