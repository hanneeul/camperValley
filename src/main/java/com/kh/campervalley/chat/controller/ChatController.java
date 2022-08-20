package com.kh.campervalley.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.chat.model.dto.Chat;
import com.kh.campervalley.chat.model.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private ChatService chatService;

	private List<Chat> messages;
	
	ChatController() {
		messages = new ArrayList<>();
	}

	@GetMapping("/chat")
	public String chat() {
		return "/usedProduct/chat/chat";	
	};
	
	@RequestMapping(value="/addMessage")
	@ResponseBody
	public Map doAddMessage(String writer, String body) {
		int id = messages.size() + 1;
		Chat chatMessage = new Chat(id, writer, body);
		
		messages.add(chatMessage);
		
		// ajax가 가져갈 출력값 객체 생성
		Map<String, Object> rs = new HashMap<>();
		
		rs.put("msg", "메세지가 전송되었습니다.");
		
		return rs;
	}
	
	@RequestMapping("/getAllMessages")
	@ResponseBody
	public List getAllMessages() {
		return messages;
	}
	
	@RequestMapping("/getMessages") 
	@ResponseBody
	public List getMessages(int from) {
		return messages.subList(from, messages.size());
	}
	
	@RequestMapping("/clear") 
	@ResponseBody
	public String clear() {
		messages.clear();
		return "메세지 전체 삭제";
	}
//	@GetMapping("/chatList")
//	public String chatList() {
//		return "/usedProduct/chat/chat";	
//	};
//	
//	@PostMapping("/chatList")
//	@ResponseBody
//	public ModelAndView chatList(HttpServletResponse response, String fromNickname, 
//														String toNickname, String chatNo) throws IOException {
//	
//		String result = null;
//		
//		result = getNick(fromNickname, toNickname);
//			
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("result", result);
//		mav.setViewName("jsonView");
//		return mav;
//	};
//	
//	@PostMapping("/dchatList")
//	@ResponseBody
//	public ModelAndView dchatList(HttpServletResponse response, String fromNickname, 
//														String toNickname, String chatNo) throws IOException {
//		
//		String result = null;
//		
//		result = getTen(fromNickname, toNickname, chatNo);
//			
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("result", result);
//		mav.setViewName("jsonView");
//		return mav;
//	}
	
	/*
	 * @PostMapping("/chatList")
	 * 
	 * @ResponseBody public void chatList(HttpServletResponse response, String
	 * fromNickname, String toNickname, String chatNo, String listType) throws
	 * IOException {
	 * 
	 * 
	 * if(fromNickname == null || fromNickname.equals("") || toNickname == null ||
	 * toNickname.equals("") || listType == null || listType.equals("")) {
	 * response.getWriter().write(""); } else if(listType.equals("ten")) {
	 * response.getWriter().write(getTen(fromNickname, toNickname));
	 * 
	 * } else { try { response.getWriter().write(getNick(fromNickname, toNickname,
	 * listType)); } catch (Exception e) { response.getWriter().write(""); } }
	 * 
	 * }
	 */
//
//	private String getTen(String fromNickname, String toNickname, String cateNo) {
//		StringBuffer result = new StringBuffer("");
//		result.append("{\"result\":[");
//		
//		Map<String, Object> map = new HashMap<>();
//		map.put("fromNickname", fromNickname);
//		map.put("toNickname", toNickname);
//		map.put("number", 10);
//		
//		List<Chat> chatList = chatService.getChatListByRecent(map);
//		System.out.println("chatListR = " + chatList);
//		
//		if(chatList.size() == 0) return "";
//		for(int i = 0; i < chatList.size(); i++) {
//			result.append("[{\"value\": \"" + chatList.get(i).getFromNickname() + "\"},");
//			result.append("{\"value\": \"" + chatList.get(i).getToNickname() + "\"},");
//			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
//			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
//			
//			if(i != chatList.size() - 1) result.append(",");
//		}
//		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatNo() + "\"}");
//		
//		return result.toString();
//	}
//	
//	private String getNick(String fromNickname, String toNickname) {
//		StringBuffer result = new StringBuffer("");
//		result.append("{\"result\":[");
//		
//		Map<String, Object> map = new HashMap<>();
//		map.put("fromNickname", fromNickname);
//		map.put("toNickname", toNickname);
//		
//		List<Chat> chatList = chatService.getChatListByNickname(map);
//		System.out.println("chatListN = " + chatList);
//		
//		if(chatList.size() == 0) return "";
//		for(int i = 0; i < chatList.size(); i++) {
//			result.append("[{\"value\": \"" + chatList.get(i).getFromNickname() + "\"},");
//			result.append("{\"value\": \"" + chatList.get(i).getToNickname() + "\"},");
//			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
//			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
//			
//			if(i != chatList.size() - 1) result.append(",");
//		}
//		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatNo() + "\"}");
//		
//		return result.toString();
//	}

	
//	@GetMapping("/getChatListById")
//	public ModelAndView getChatListById(String fromNickname, String toNickname, String chatNo) {
//		
//		Map<String, Object> map = new HashMap<>();
//		map.put("fromNickname", fromNickname);
//		map.put("toNickname", toNickname);
//		map.put("chatNo", Integer.parseInt(chatNo));
//	
//		List<Chat> chatList = chatService.getChatListById(map);
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("chatList", chatList);
//		mav.setViewName("jsonView");
//		return mav;
//	
//	}
//	
//	@GetMapping("/getChatListByRecent")
//	public ModelAndView getChatListByRecent(String fromNickname, String toNickname, String chatNo) {
//		
//
//	
//		List<Chat> chatList = chatService.getChatListByRecent(map);
//		
//
//	
//	}
	
	@PostMapping("/submit")
	@ResponseBody
	public ModelAndView submit(String fromNickname, String toNickname, String chatContent) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<>();
		map.put("fromNickname", fromNickname);
		map.put("toNickname", toNickname);
		map.put("chatContent", chatContent);
		
		try {
			
			int result = chatService.submit(map);
			
			System.out.println("result =" + result);
			
			mav.addObject("result", result);
			mav.setViewName("jsonView");
			
		} catch(Exception e) {
			log.error("채팅 전송 오류", e);
			e.printStackTrace();
		}
		return mav;
	
	}

}
