package com.kh.iag.chat.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.chat.dao.ChatDao;
import com.kh.iag.chat.entity.ChatDto;
import com.kh.iag.user.entity.UserDto;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao dao;
	
	@Override
	public List<ChatDto> selectChatListById(ChatDto dto) throws Exception {
		return dao.selectChatListById(dto);
	}

	@Override
	public List<ChatDto> selectChatListByRecent(ChatDto dto) throws Exception {
		return dao.selectChatListByRecent(dto);
	}

	@Override
	public int insertChatContent(ChatDto dto) throws Exception {
		return dao.insertChatContent(dto);
	}

	@Override
	public int readChat(ChatDto dto) throws Exception {
		return dao.readChat(dto);
	}

	@Override
	public int unreadedChat(String userNo) throws Exception {
		return dao.unreadedChat(userNo);
	}

	@Override
	public List<ChatDto> selectChatListBox(String userNo) throws Exception {
		return dao.selectChatListBox(userNo);
	}

	@Override
	public ChatDto getUserValue(String toId) throws Exception {
		return dao.getUserValue(toId);
	}

	@Override
	public String selectChatUnreadedEsp(ChatDto chatDto) throws Exception {
		return dao.selectChatUnreadedEsp(chatDto);
	}

	@Override
	public List<UserDto> selectUserList() throws Exception {
		return dao.selectuserList();
	}

}
