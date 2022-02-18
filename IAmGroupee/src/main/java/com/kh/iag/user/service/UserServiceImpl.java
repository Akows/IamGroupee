package com.kh.iag.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.iag.main.controller.MainController;
import com.kh.iag.user.dao.UserDao;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public UserDto login(UserDto dto){
		// DB에서 사원정보 조회
		UserDto dbUser = dao.getUserByNo(dto);
//		if (passwordEncoder.matches(dto.getPwd(), dbUser.getPwd())) {
		if(dbUser.getPwd().equals(dto.getPwd())) {
			//로그인 성공
			return dbUser;
		} else {
			//로그인 실패
			return null;
		}
	}

}
