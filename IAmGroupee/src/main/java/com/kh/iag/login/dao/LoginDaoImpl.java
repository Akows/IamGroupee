package com.kh.iag.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.login.service.LoginService;
import com.kh.iag.user.entity.UserDto;
import com.kh.iag.user.service.UserServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class LoginDaoImpl implements LoginDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public UserDto getUserByNo(UserDto dto) throws Exception{
		UserDto u = session.selectOne("login.getUserByNo", dto);
		return u;
	}
}
