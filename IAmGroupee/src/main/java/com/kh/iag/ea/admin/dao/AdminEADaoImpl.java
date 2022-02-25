package com.kh.iag.ea.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.ea.entity.PositionDto;
import com.kh.iag.ea.entity.SettingsDto;

@Repository
public class AdminEADaoImpl implements AdminEADao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public SettingsDto defaultSettings() throws Exception {
		return sqlSession.selectOne("ea.defaultSettings");
	}

	@Override
	public List<PositionDto> positionValues() throws Exception {
		return sqlSession.selectList("ea.positionValues");
	}

}
