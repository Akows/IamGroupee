package com.kh.iag.chat.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.chat.entity.ChatDto;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ChatDto> selectChatListById(ChatDto dto) {
		return sqlSession.selectList("chat.selectChatListById", dto);
	}

	@Override
	public List<ChatDto> selectChatListByRecent(ChatDto dto) {
		return sqlSession.selectList("chat.selectChatListByRecent", dto);
	}

	@Override
	public int insertChatContent(ChatDto dto) {
		return sqlSession.insert("chat.insertChatContent", dto);
	}

}
