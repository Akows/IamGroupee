package com.kh.iag.chat.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.chat.entity.ChatDto;
import com.kh.iag.user.entity.UserDto;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ChatDto> selectChatListById(ChatDto dto) throws Exception {
		return sqlSession.selectList("chat.selectChatListById", dto);
	}

	@Override
	public List<ChatDto> selectChatListByRecent(ChatDto dto) throws Exception {
		return sqlSession.selectList("chat.selectChatListByRecent", dto);
	}

	@Override
	public int insertChatContent(ChatDto dto) throws Exception {
		return sqlSession.insert("chat.insertChatContent", dto);
	}

	@Override
	public int readChat(ChatDto dto) throws Exception {
		return sqlSession.update("chat.updateChatRead", dto);
	}

	@Override
	public int unreadedChat(String userNo) throws Exception {
		return sqlSession.selectOne("chat.selectChatUnreaded", userNo);
	}

	@Override
	public List<ChatDto> selectChatListBox(String userNo) throws Exception {
		return sqlSession.selectList("chat.selectChatListBox", userNo);
	}

	@Override
	public ChatDto getUserValue(String toId) throws Exception {
		return sqlSession.selectOne("chat.getUserValue", toId);
	}

	@Override
	public String selectChatUnreadedEsp(ChatDto chatDto) throws Exception {
		return sqlSession.selectOne("chat.selectChatUnreadedEsp", chatDto);
	}

	@Override
	public List<UserDto> selectuserList() throws Exception {
		return sqlSession.selectList("chat.selectuserList");
	}

}
