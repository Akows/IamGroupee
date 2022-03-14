package com.kh.iag.mypage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
