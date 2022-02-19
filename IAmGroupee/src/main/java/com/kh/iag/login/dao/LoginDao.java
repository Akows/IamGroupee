package com.kh.iag.login.dao;

import com.kh.iag.user.entity.UserDto;

public interface LoginDao {

	UserDto getUserByNo(UserDto dto) throws Exception;
	
}
