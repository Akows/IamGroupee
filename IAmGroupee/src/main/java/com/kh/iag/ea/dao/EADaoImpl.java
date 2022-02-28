package com.kh.iag.ea.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.ea.entity.FormDto;

@Service
public class EADaoImpl implements EADao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public FormDto signupFormValue(FormDto dto) {
		return sqlSession.selectOne("ea.signupFormValue", dto);
	}

}
