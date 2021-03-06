package com.kh.iag.login.service;

import java.util.Date;

import com.kh.iag.user.entity.UserDto;

public interface LoginService {

	UserDto login(UserDto dto) throws Exception;

	int savedLoginCookie(String userNo, String sessionId, Date sessionLimit) throws Exception;

	UserDto checkUserBySsKey(String sessionKey) throws Exception;

	UserDto getFindUser(String userNo) throws Exception;

	void sendMail(UserDto fineUser) throws Exception;

	String changePwd(String userNo) throws Exception;
	
}
