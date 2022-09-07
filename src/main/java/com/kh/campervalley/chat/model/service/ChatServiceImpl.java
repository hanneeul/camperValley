package com.kh.campervalley.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.campervalley.chat.model.dao.ChatDao;
import com.kh.campervalley.chat.model.dto.ChatContent;
import com.kh.campervalley.chat.model.dto.ChatRoom;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Service
@Slf4j
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatDao chatDao;
	
	@Override
	public List<ChatContent> findRecentChatList(String loginMemberNickname) {
		return chatDao.findRecentChatList(loginMemberNickname);
	}

	@Override
	public int deleteChatRoom(String chatroomId) {
		return chatDao.deleteChatRoom(chatroomId);
	}

	@Override
	public List<ChatContent> findChatRoomList(String chatroomId) {
		return chatDao.findChatRoomList(chatroomId);
	}

	@Override
	public int insertChatContentSend(Map<String, Object> payload) {
		return chatDao.insertChatContentSend(payload);
	}

	@Override
	public ChatRoom findChatRoomByMemberNickname(String buyerNickname, String sellerNickname) {
		ChatRoom chatRoom = null;
		chatRoom = chatDao.findChatRoomBySellerNickname(buyerNickname, sellerNickname);
		if(chatRoom == null) 
			chatRoom = chatDao.findChatRoomByBuyerNickname(sellerNickname, buyerNickname);
		return chatRoom;
	}

	@Override
	public List<ChatContent> findChatContentByChatRoomId(String chatroomId) {
		return chatDao.findChatContentByChatRoomId(chatroomId);
	}

	@Override
	public int createChatRoom(String chatroomId, String buyerNickname, String sellerNickname) {
		return chatDao.createChatRoom(chatroomId, buyerNickname, sellerNickname);
	}

}
