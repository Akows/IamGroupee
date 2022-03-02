package com.kh.iag.ea.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.ea.entity.DeptDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.ProcessDto;
import com.kh.iag.ea.entity.EAUserDto;

@Service
public class EADaoImpl implements EADao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public FormDto signupFormValue(FormDto dto) throws Exception {
		return sqlSession.selectOne("ea.signupFormValue", dto);
	}

	@Override
	public List<DeptDto> deptValues() throws Exception {
		return sqlSession.selectList("ea.deptValues");
	}

	@Override
	public List<EAUserDto> userValue(String userNo) throws Exception {
		return sqlSession.selectList("ea.userValues", userNo);
	}

	@Override
	public int insertProcess(ProcessDto pd) throws Exception {
		return sqlSession.insert("insertProcess", pd);
	}
}
