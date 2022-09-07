package com.kh.campervalley.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.campervalley.chat.model.dto.ChatContent;
import com.kh.campervalley.chat.model.dto.ChatRoom;
import com.kh.campervalley.chat.model.service.ChatService;
import com.kh.campervalley.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	ChatService chatService;
	
	@GetMapping("/chatMainPage")
	public void chatMainPage() {}
	 
	@GetMapping("/chatRoom")
	public void chatRoom(@AuthenticationPrincipal Member member, @RequestParam String nickname, Model model) {
		String buyerNickname = member.getNickname();
		String sellerNickname = nickname;
		log.debug("sellerNickname = {}", sellerNickname);
		log.debug("buyerNickname = {}", buyerNickname);
		
		// seller와 buyer 둘 다 확인
		ChatRoom chatRoom = chatService.findChatRoomByMemberNickname(buyerNickname, sellerNickname);
		log.debug("chatRoom = {}", chatRoom);
		
		String chatroomId = null;
		if(chatRoom != null) {
			// 채팅방이 존재하는 경우
			chatroomId = chatRoom.getChatroomId();
			// 채팅내역 가져오기
			List<ChatContent> chatContentList = chatService.findChatContentByChatRoomId(chatroomId);
			log.debug("chatCotentList = {}", chatContentList);
			model.addAttribute("chatContentList", chatContentList);
		} else {
			// 채팅방 처음 입장
			// chatroomId 생성
			chatroomId = getChatroomId();
			
			// 채팅방 생성
			int result = chatService.createChatRoom(chatroomId, buyerNickname, sellerNickname);
		}
		log.debug("chatroomId = {}", chatroomId);
		model.addAttribute("chatroomId", chatroomId);
		model.addAttribute("sellerNickname", sellerNickname);
				
	}
	
	private String getChatroomId() {
		final int LEN = 8;
		Random rnd = new Random();
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < LEN; i++) {
			if(rnd.nextBoolean()) {
				if(rnd.nextBoolean())
					sb.append((char)(rnd.nextInt(26) + 'A'));
				else
					sb.append((char)(rnd.nextInt(26) + 'a'));
			}
			else {
				sb.append(rnd.nextInt(10));
			}
		}
		return sb.toString();
	}

	@GetMapping(value = "/deleteChatRoom", produces = "application/json")
	public ResponseEntity<?> deleteChatRoom(@RequestParam String chatroomId) {
		log.debug("chatRoomId = {}", chatroomId);
		Map<String, Object> map = new HashMap<>();
		
		try {
			int result = chatService.deleteChatRoom(chatroomId);
			map.put("msg", "채팅방을 나가셨습니다.");
			return ResponseEntity.ok(map);
			
		} catch(Exception e) {
			log.error("채팅방 삭제 오류", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	
	@GetMapping(value = "/room.do", produces = "application/json")
	public ResponseEntity<?> roomContentList(Map<String, Object> chatRoomList, @RequestParam String chatroomId) {
		try {
			log.debug("chatRoomId = {}", chatroomId);
			List<ChatContent> list = chatService.findChatRoomList(chatroomId);
			log.debug("list = {}", list);
			return ResponseEntity.ok(list);
		} catch(Exception e) {
			log.error("채팅방 내용 조회 오류", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	
	@GetMapping(value = "/chatList", produces = "application/json")
	public ResponseEntity<?> chatList(Map<String, Object> chatList, @RequestParam String loginMemberNickname) {
		try {
			List<ChatContent> list = chatService.findRecentChatList(loginMemberNickname);
			return ResponseEntity.ok(list);
		} catch(Exception e) {
			log.error("채팅목록조회오류", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	
}
