package com.kh.iag.login.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.login.service.LoginService;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class LoginDaoImpl implements LoginDao {
	
	@Autowired
	private SqlSession session;

	@Override // 로그인 로직 처리
	public UserDto getUserByNo(UserDto dto) throws Exception{
		UserDto d = session.selectOne("login.getUserByNo", dto);
		return d;
	}

	@Override // 사용자 db에 세션쿠키정보 넣기
	public int savedLoginCookie(String userNo, String sessionId, Date sessionLimit) throws Exception {
		
		Map<String, Object> cookieInfo = new HashMap<String, Object>();
		cookieInfo.put("userNo", userNo);
		cookieInfo.put("sessionKey", sessionId);
		cookieInfo.put("sessionLimit", sessionLimit);
		
		return session.update("login.savedLoginCookie", cookieInfo);
	}

	@Override
	public UserDto checkUserBySsKey(String sessionKey) throws Exception {
		return session.selectOne("login.checkUserBySsKey", sessionKey);
	}
	
}















