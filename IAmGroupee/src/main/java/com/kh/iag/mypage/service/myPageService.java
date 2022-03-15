package com.kh.iag.mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kh.iag.mypage.entity.addressBookDto;
import com.kh.iag.ps.admin.entity.UserDto;

public interface myPageService {

	UserDto getUser(String userNo) throws Exception;

	int userUpdate(UserDto user, HttpServletRequest req) throws Exception;

	List<addressBookDto> getAdBook(String userNo) throws Exception;

	List<UserDto> getAllUser() throws Exception;

	int addBook(addressBookDto book) throws Exception;

	int delBook(int addressNo) throws Exception;

	int bookNameModi(addressBookDto book) throws Exception;

	int bookUserModi(addressBookDto book) throws Exception;

}
