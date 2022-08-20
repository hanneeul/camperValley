package com.kh.campervalley.chat.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Chat {

	int chatNo;
	String fromNickname;
	String toNickname;
	int productNo;
	String chatContent;
	Date chatTime;
	
	public Chat(int chatNo, String fromNickname, String chatContent) {
		super();
		this.chatNo = chatNo;
		this.fromNickname = fromNickname;
		this.chatContent = chatContent;
	}
	
	
}
