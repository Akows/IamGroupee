package com.kh.iag.login.service;

import com.kh.iag.user.entity.UserDto;

public interface LoginService {

	UserDto login(UserDto dto) throws Exception;
	
}
