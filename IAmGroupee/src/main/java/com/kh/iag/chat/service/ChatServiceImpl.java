package com.kh.iag.chat.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.chat.dao.ChatDao;
import com.kh.iag.chat.entity.ChatDto;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao dao;
	
	@Override
	public List<ChatDto> selectChatListById(ChatDto dto) {
		return dao.selectChatListById(dto);
	}

	@Override
	public List<ChatDto> selectChatListByRecent(ChatDto dto) {
		return dao.selectChatListByRecent(dto);
	}

	@Override
	public int insertChatContent(ChatDto dto) {
		return dao.insertChatContent(dto);
	}

}
