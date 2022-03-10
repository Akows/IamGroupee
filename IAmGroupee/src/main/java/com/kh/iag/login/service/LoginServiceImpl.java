package com.kh.iag.login.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.iag.login.dao.LoginDao;
import com.kh.iag.user.entity.UserDto;
import com.kh.iag.user.service.UserServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override // 로그인
	public UserDto login(UserDto dto) throws Exception{
		UserDto dbUser = dao.getUserByNo(dto);
		if (passwordEncoder.matches(dto.getPwd(), dbUser.getPwd())) {
			// 세션아이디와 유효시간 DB에 저장
			return dbUser;
		} else {
			return null;
		}
	}

	@Override
	public int savedLoginCookie(String userNo, String sessionId, Date sessionLimit) throws Exception {
		return dao.savedLoginCookie(userNo, sessionId, sessionLimit);
	}

	@Override
	public UserDto checkUserBySsKey(String sessionKey) throws Exception {
		return dao.checkUserBySsKey(sessionKey);
	}
	
}
