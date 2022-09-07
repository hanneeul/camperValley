package com.kh.campervalley.chat;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.kh.campervalley.chat.model.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StompController {

	@Autowired
	ChatService chatService;
	
	@MessageMapping("/chat/{chatroomId}")
	@SendTo("/app/chat/{chatroomId}")
	public Map<String, Object> sendChat(Map<String, Object> payload, @DestinationVariable String chatroomId) {
		log.debug("payload = {}",payload);
		int result = chatService.insertChatContentSend(payload);
		return payload;
	}
}
