package com.kh.iag.ea.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.ea.entity.CategoryDto;
import com.kh.iag.ea.entity.FormDto;
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

	@Override
	public int updateSettings1(SettingsDto dto) throws Exception {
		return sqlSession.update("ea.updateSettings1", dto);
	}

	@Override
	public int updateSettings2(SettingsDto dto) throws Exception {
		return sqlSession.update("ea.updateSettings2", dto);
	}

	@Override
	public int updateSettings3(SettingsDto dto) throws Exception {
		return sqlSession.update("ea.updateSettings3", dto);
	}

	@Override
	public List<CategoryDto> categoryValues() throws Exception {
		return sqlSession.selectList("ea.categoryValues");
	}

	@Override
	public List<FormDto> formValues() throws Exception {
		return sqlSession.selectList("ea.formValues");
	}

}
