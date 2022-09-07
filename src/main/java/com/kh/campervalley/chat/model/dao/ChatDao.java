package com.kh.campervalley.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.campervalley.chat.model.dto.ChatContent;
import com.kh.campervalley.chat.model.dto.ChatRoom;

@Mapper
public interface ChatDao {

	@Insert("insert into chat_room (chatroom_id, buyer_nickname, seller_nickname) values (#{chatroomId}, #{buyerNickname}, #{sellerNickname})")
	int createChatRoom(@Param("chatroomId")String chatroomId, @Param("buyerNickname")String buyerNickname, @Param("sellerNickname")String sellerNickname);
	
	@Select("select * from (select cc.*, row_number() over(partition by chatroom_id order by message_time desc) rnum from chat_content cc where buyer_nickname = #{loginMemberNickname} or seller_nickname = #{loginMemberNickname}) cc where rnum = 1 order by message_time desc")
	List<ChatContent> findRecentChatList(String loginMemberNickname);

	@Delete("delete from chat_room where chatroom_id = #{chatroomId}")
	int deleteChatRoom(@Param("chatroomId")String chatroomId);

	@Select("select * from chat_content where chatroom_id = #{chatroomId} order by content_no")
	List<ChatContent> findChatRoomList(String chatroomId);

	@Insert("insert into chat_content values (seq_chat_content_no.nextval, #{chatroomId}, #{buyerNickname}, #{sellerNickname}, #{msg}, to_date((#{time}), 'YYYY-MM-DD HH24:MI:SS'))")
	int insertChatContentSend(Map<String, Object> payload);

	// 채팅방 존재 여부
	@Select("select * from chat_room where buyer_nickname = #{buyerNickname} and seller_nickname = #{sellerNickname}")
	ChatRoom findChatRoomBySellerNickname(@Param("buyerNickname")String buyerNickname, @Param("sellerNickname")String sellerNickname);
	
	// 채팅방 존재 여부
	@Select("select * from chat_room where buyer_nickname = #{sellerNickname} and seller_nickname = #{buyerNickname}")
	ChatRoom findChatRoomByBuyerNickname(@Param("sellerNickname")String sellerNickname, @Param("buyerNickname")String buyerNickname);

	@Select("select * from chat_content where chatroom_id = #{chatroomId} order by content_no")
	List<ChatContent> findChatContentByChatRoomId(String chatroomId);


}
