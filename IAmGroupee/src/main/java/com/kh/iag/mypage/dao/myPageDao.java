package com.kh.iag.mypage.dao;

import com.kh.iag.ps.admin.entity.UserDto;

public interface myPageDao {

	UserDto getUser(String userNo) throws Exception;

	int userUpdate(UserDto user) throws Exception;

}
