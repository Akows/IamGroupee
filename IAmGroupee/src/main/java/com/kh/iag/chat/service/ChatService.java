package com.kh.iag.chat.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.iag.chat.entity.ChatDto;
import com.kh.iag.user.entity.UserDto;

public interface ChatService {

	List<ChatDto> selectChatListById(ChatDto dto) throws Exception;

	List<ChatDto> selectChatListByRecent(ChatDto dto) throws Exception;

	int insertChatContent(ChatDto dto) throws Exception;

	int readChat(ChatDto dto) throws Exception;

	int unreadedChat(String userNo) throws Exception;

	List<ChatDto> selectChatListBox(String userNo) throws Exception;

	ChatDto getUserValue(String toId) throws Exception;

	String selectChatUnreadedEsp(ChatDto chatDto) throws Exception;

	List<UserDto> selectUserList() throws Exception;

}
