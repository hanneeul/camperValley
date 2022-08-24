package com.kh.campervalley.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.campervalley.chat.model.dto.ChatLog;
import com.kh.campervalley.chat.model.dto.ChatMember;
import com.kh.campervalley.chat.model.service.ChatService;
import com.kh.campervalley.member.model.dto.Member;
import com.kh.campervalley.usedProduct.model.service.UsedProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	ChatService chatService;
	
	@Autowired
	UsedProductService usedProductService;
	
	@GetMapping("/chat")
	public void chat(@AuthenticationPrincipal Member member, @RequestParam("no") String no, Model model) {
		// seller, buyer 정보
		Member seller = usedProductService.getSellerInfo(Integer.parseInt(no));
		String sellerId = seller.getMemberId();
		String buyerId = member.getMemberId();
		String buyerImg = member.getProfileImg();
		
		Map<String, Object> map = new HashMap<>();
		map.put("sellerId", sellerId);
		map.put("buyerId", buyerId);
		map.put("buyerImg", buyerImg);
		
		ChatMember chatMember = chatService.findChatMemberByMemberId(map);
		
		log.debug("chatMember = {}", chatMember);
		
		String chatroomId = null;
		if(chatMember != null) {
			// 채팅방이 존재하는 경우
				
				chatroomId = chatMember.getChatroomId();
				
				log.debug("chatroomId = {}", chatroomId);
				
				// 채팅내역 가져오기
				List<ChatLog> chatLogList = chatService.findChatLogByChatroomId(chatroomId);
				log.debug("chatLogList = {}", chatLogList);
				model.addAttribute("chatLogList", chatLogList);
			
		} else {		
				if(!sellerId.equals(buyerId)) {				
					// 채팅방에 처음 입장한 경우
					// chatroomId생성
					chatroomId = getChatroomId();
					log.debug("chatroomId = {}", chatroomId);
					
					// 채팅방멤버 생성 (member, admin)
					ChatMember chatMemberList = new ChatMember();
					
					map.put("chatroomId", chatroomId);
					
					
					int result = chatService.createChatroom(map);
					
					log.debug("result = {}", result);		
				}
		}
		List<ChatLog> list = chatService.findRecentChatLogList(map);
		
		log.debug("Recentlist = {}", list);
		
		model.addAttribute("list", list);
		
		log.debug("chatroomId = {}", chatroomId);
		model.addAttribute("chatroomId", chatroomId);
		model.addAttribute("sellerId", sellerId);
		log.debug("sellerId = {}", sellerId);
		model.addAttribute("no", no);
	
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
			} else {
				sb.append(rnd.nextInt(10));
			}
		}
		return sb.toString();
	}
	
	/**
	 * 로그인 성공시 후처리
	 */
	/*
	 * @PostMapping("/loginSuccess.do") public String loginSuccess(@RequestParam
	 * String memberId, HttpSession session, Model model) { Member seller =
	 * usedProductService.getSellerInfo(Integer.parseInt(no)); String sellerId =
	 * sellerId.getMemberId(); String buyerId = member.getMemberId(); String
	 * buyerImg = member.getProfileImg();
	 * 
	 * Map<String, Object> map = new HashMap<>(); map.put("sellerId", sellerId);
	 * map.put("buyerId", buyerId); map.put("buyerImg", buyerImg);
	 * 
	 * log.debug("loginSuccess");
	 * 
	 * // 관리자와의 1:1채팅 안읽은 메세지 카운팅 ChatMember chatMember =
	 * chatService.findChatMemberByMemberId(memberId); int unreadCount = 0;
	 * if(chatMember != null) { unreadCount =
	 * chatService.getUnreadCount(chatMember); // 세션스코프에 저장 (리다이렉트이기때문)
	 * session.setAttribute("unreadCount", unreadCount); }
	 * log.debug("unreadCount = {}", unreadCount);
	 * 
	 * 
	 * // security redirect 사용하기 SavedRequest savedRequest = (SavedRequest)
	 * session.getAttribute("SPRING_SECURITY_SAVED_REQUEST"); String location = "/";
	 * if (savedRequest != null) location = savedRequest.getRedirectUrl();
	 * 
	 * log.debug("location = {}", location);
	 * 
	 * return "redirect:" + location; }
	 */
	
}
