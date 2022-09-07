package com.kh.campervalley.chat.model.service;

import java.util.List;
import java.util.Map;

import com.kh.campervalley.chat.model.dto.ChatContent;
import com.kh.campervalley.chat.model.dto.ChatRoom;

public interface ChatService {

	List<ChatContent> findRecentChatList(String loginMemberNickname);

	int deleteChatRoom(String chatroomId);

	List<ChatContent> findChatRoomList(String chatroomId);

	int insertChatContentSend(Map<String, Object> payload);

	ChatRoom findChatRoomByMemberNickname(String buyerNickname, String sellerNickname);

	List<ChatContent> findChatContentByChatRoomId(String chatroomId);

	int createChatRoom(String chatroomId, String buyerNickname, String sellerNickname);

}
