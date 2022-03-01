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
	public SettingsDto checkInitialSettings() throws Exception {
		return sqlSession.selectOne("ea.defaultSettings");
	}

	@Override
	public int insertInitialSettings1(SettingsDto dto) throws Exception {
		return sqlSession.insert("ea.insertInitialSettings1", dto);
	}

	@Override
	public int insertInitialSettings2(SettingsDto dto) throws Exception {
		return sqlSession.insert("ea.insertInitialSettings2", dto);
	}

	@Override
	public int insertInitialSettings3(SettingsDto dto) throws Exception {
		return sqlSession.insert("ea.insertInitialSettings3", dto);
	}
	
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

	@Override
	public int insertFormCategory() throws Exception {
		return sqlSession.insert("ea.insertFormCategory");
	}

	@Override
	public CategoryDto selectLatestFormCategory() throws Exception {
		return sqlSession.selectOne("ea.selectLatestFormCategory");
	}

	@Override
	public int deleteFormCategory(String categoryNo) throws Exception {
		return sqlSession.delete("ea.deleteFormCategory", categoryNo);
	}

	@Override
	public int insertForm(String categoryNo) throws Exception {
		return sqlSession.insert("ea.insertForm", categoryNo);
	}

	@Override
	public FormDto selecLatestForm() throws Exception {
		return sqlSession.selectOne("ea.selecLatestForm");
	}

	@Override
	public int deleteForm(String formNo) throws Exception {
		return sqlSession.delete("ea.deleteForm", formNo);
	}

	@Override
	public int updateCategoryName(CategoryDto dto) throws Exception {
		return sqlSession.update("ea.updateCategoryName", dto);
	}

	@Override
	public int updateFormName(FormDto dto) throws Exception{
		return sqlSession.update("ea.updateFormName", dto);
	}

	@Override
	public FormDto formValue(FormDto dto) throws Exception {
		return sqlSession.selectOne("ea.formValue", dto);
	}

	@Override
	public int editForm(FormDto dto) throws Exception {
		return sqlSession.update("ea.editForm", dto);
	}

}
