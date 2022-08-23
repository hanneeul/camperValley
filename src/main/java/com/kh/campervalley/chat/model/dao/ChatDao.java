package com.kh.campervalley.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.campervalley.chat.model.dto.ChatLog;
import com.kh.campervalley.chat.model.dto.ChatMember;

@Mapper
public interface ChatDao {

	int insertChatMember(Map<String, Object> map);

	@Select("select * from chat_member where seller_id in (#{sellerId}, #{buyerId}) and buyer_id in (#{sellerId}, #{buyerId})")
	ChatMember findChatMemberByMemberId(Map<String, Object> map);

	@Insert("insert into chat_log values (seq_chat_log_no.nextval, #{chatroomId}, #{memberId}, null, #{msg}, #{time})")
	int insertChatLog(Map<String, Object> payload);

	@Select("select * from chat_log where chatroom_id = #{chatroomId} order by time")
	List<ChatLog> findChatLogByChatroomId(String chatroomId);

	List<ChatLog> findRecentChatLogList(Map<String, Object> map);
}
