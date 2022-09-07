package com.kh.campervalley.chat.model.dto;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatContent {

	private long contentNo;
	@NonNull
	private String chatroomId;
	@NonNull
	private String sellerNickname;
	@NonNull
	private String buyerNickname;
	private String messageContent;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime messageTime;
	
}
