package com.kh.campervalley.ws;

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
	
	/**
	 * 사용자가 /app/def 메세지를 전송한 경우
	 * 
	 * topic/abc 구독자에게 메세지 전송 (SimpleBroker)
	 *
	 *
	 */
	@MessageMapping("/def")
	@SendTo("/app/def")
	public String app(String msg) {
		log.debug("/app/def : {}", msg);
		return msg;
	}
	
	@MessageMapping("/chat/{chatroomId}")
	@SendTo("/app/chat/{chatroomId}")
	public Map<String, Object> chat(Map<String, Object> payload, @DestinationVariable String chatroomId) {
		log.debug("payload = {}", payload);
		int result = chatService.insertChatLog(payload);
		log.debug("result = {}" + result);
		
		return payload;
	}
}
