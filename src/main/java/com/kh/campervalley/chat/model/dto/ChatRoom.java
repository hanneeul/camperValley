package com.kh.campervalley.chat.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class ChatRoom {

	@NonNull
	private String chatroomId;
	@NonNull
	private String sellerNickname;
	@NonNull
	private String buyerNickname;
	private String lastCheck;
	private LocalDateTime createdAt;
	private LocalDateTime deletedAt;
}
