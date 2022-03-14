package com.kh.iag.mypage.service;

import javax.servlet.http.HttpServletRequest;

import com.kh.iag.ps.admin.entity.UserDto;

public interface myPageService {

	UserDto getUser(String userNo) throws Exception;

	int userUpdate(UserDto user, HttpServletRequest req) throws Exception;

}
