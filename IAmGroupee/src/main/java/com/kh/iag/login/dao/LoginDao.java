package com.kh.iag.login.dao;

import java.util.Date;

import com.kh.iag.user.entity.UserDto;

public interface LoginDao {

	UserDto getUserByNo(UserDto dto) throws Exception;

	int savedLoginCookie(String userNo, String sessionId, Date sessionLimit) throws Exception;

	UserDto checkUserBySsKey(String sessionKey) throws Exception;
	
}
