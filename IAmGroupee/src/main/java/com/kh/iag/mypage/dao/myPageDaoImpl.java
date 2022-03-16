package com.kh.iag.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.mypage.entity.addressBookDto;
import com.kh.iag.mypage.entity.updateAddress;
import com.kh.iag.ps.admin.entity.UserDto;

@Repository
public class myPageDaoImpl implements myPageDao {

	@Autowired
	private SqlSession ss;
	
	@Override
	public UserDto getUser(String userNo) throws Exception {
		return ss.selectOne("myPage.getUser", userNo);
	}

	@Override
	public int userUpdate(UserDto user) throws Exception {
		return ss.update("myPage.updateUser", user);
	}

	@Override
	public List<addressBookDto> getAdBook(String userNo) throws Exception {
		return ss.selectList("myPage.getAdBook", userNo);
	}

	@Override
	public List<UserDto> getBookUserList(int addressNo) throws Exception {
		return ss.selectList("myPage.getBookUserList", addressNo);
		
	}

	@Override
	public List<UserDto> getAllUser() throws Exception {
		return ss.selectList("myPage.userList");
	}

	@Override
	public int addBook(addressBookDto book) throws Exception {
		return ss.insert("myPage.addBook", book);
	}

	@Override
	public void addBookData(String user) throws Exception {
		ss.insert("myPage.addBookData", user);
	}

	@Override
	public int delBook(int addressNo) throws Exception {
		return ss.delete("myPage.delBook", addressNo);
	}

	@Override
	public void delBookData(int addressNo) throws Exception {
		ss.delete("myPage.delBookData", addressNo);
	}

	@Override
	public int bookNameModi(addressBookDto book) throws Exception {
		return ss.update("myPage.bookNameModi", book);
	}

	@Override
	public int updateBookData(updateAddress uBook) throws Exception {
		return ss.insert("myPage.updateBookData", uBook);
	}

	@Override
	public int delBookDataUser(updateAddress deluser) throws Exception {
		return ss.delete("myPage.delBookUser", deluser);
	}

}
