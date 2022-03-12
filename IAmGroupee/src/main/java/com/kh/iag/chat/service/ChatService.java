package com.kh.iag.chat.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.iag.chat.entity.ChatDto;

public interface ChatService {

	List<ChatDto> selectChatListById(ChatDto dto);

	List<ChatDto> selectChatListByRecent(ChatDto dto);

	int insertChatContent(ChatDto dto);

}
