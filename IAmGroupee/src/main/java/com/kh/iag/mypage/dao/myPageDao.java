package com.kh.iag.mypage.dao;

import java.util.List;

import com.kh.iag.mypage.entity.addressBookDto;
import com.kh.iag.mypage.entity.updateAddress;
import com.kh.iag.ps.admin.entity.UserDto;

public interface myPageDao {

	UserDto getUser(String userNo) throws Exception;

	int userUpdate(UserDto user) throws Exception;

	List<addressBookDto> getAdBook(String userNo) throws Exception;

	List<UserDto> getBookUserList(int addressNo) throws Exception;

	List<UserDto> getAllUser() throws Exception;

	int addBook(addressBookDto book) throws Exception;

	void addBookData(String user) throws Exception;

	int delBook(int addressNo) throws Exception;

	void delBookData(int addressNo) throws Exception;

	int bookNameModi(addressBookDto book) throws Exception;

	int updateBookData(updateAddress uBook) throws Exception;

}
