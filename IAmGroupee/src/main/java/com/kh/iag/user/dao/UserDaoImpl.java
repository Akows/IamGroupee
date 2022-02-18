package com.kh.iag.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.main.controller.MainController;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public UserDto getUserByNo(UserDto dto) {
		
		UserDto u = session.selectOne("user.getUserByNo", dto);
		return u;
	}

}
