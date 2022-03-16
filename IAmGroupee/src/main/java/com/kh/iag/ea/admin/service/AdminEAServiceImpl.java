package com.kh.iag.ea.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.ea.admin.dao.AdminEADao;
import com.kh.iag.ea.entity.CategoryDto;
import com.kh.iag.ea.entity.DocsDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.PositionDto;
import com.kh.iag.ea.entity.SettingsDto;

@Service
public class AdminEAServiceImpl implements AdminEAService {

	@Autowired
	private AdminEADao dao;

	@Override
	public SettingsDto checkInitialSettings() throws Exception {
		return dao.checkInitialSettings();
	}

	@Override
	public int insertInitialSettings1(SettingsDto dto) throws Exception {
		return dao.insertInitialSettings1(dto);
	}

	@Override
	public int insertInitialSettings2(SettingsDto dto) throws Exception {
		return dao.insertInitialSettings2(dto);
	}

	@Override
	public int insertInitialSettings3(SettingsDto dto) throws Exception {
		return dao.insertInitialSettings3(dto);
	}
	
	@Override
	public SettingsDto defaultSettings() throws Exception {
		return dao.defaultSettings();
	}

	@Override
	public List<PositionDto> positionValues() throws Exception {
		return dao.positionValues();
	}

	@Override
	public int updateSettings1(SettingsDto dto) throws Exception {
		return dao.updateSettings1(dto);
	}

	@Override
	public int updateSettings2(SettingsDto dto) throws Exception {
		return dao.updateSettings2(dto);
	}

	@Override
	public int updateSettings3(SettingsDto dto) throws Exception {
		return dao.updateSettings3(dto);
	}

	@Override
	public List<CategoryDto> categoryValues() throws Exception {
		return dao.categoryValues();
	}

	@Override
	public List<FormDto> formValues() throws Exception {
		return dao.formValues();
	}

	@Override
	public int insertFormCategory() throws Exception {
		return dao.insertFormCategory();
	}

	@Override
	public CategoryDto selectLatestFormCategory() throws Exception {
		return dao.selectLatestFormCategory();
	}

	@Override
	public int deleteFormCategory(String categoryNo) throws Exception {
		return dao.deleteFormCategory(categoryNo);
	}

	@Override
	public int insertForm(String categoryNo) throws Exception {
		return dao.insertForm(categoryNo);
	}

	@Override
	public FormDto selecLatestForm() throws Exception {
		return dao.selecLatestForm();
	}

	@Override
	public int deleteForm(String formNo) throws Exception {
		return dao.deleteForm(formNo);
	}

	@Override
	public int updateCategoryName(CategoryDto dto) throws Exception {
		return dao.updateCategoryName(dto);
	}

	@Override
	public int updateFormName(FormDto dto) throws Exception {
		return dao.updateFormName(dto);
	}

	@Override
	public FormDto formValue(FormDto dto) throws Exception {
		return dao.formValue(dto);
	}

	@Override
	public int editForm(FormDto dto) throws Exception {
		return dao.editForm(dto);
	}

	@Override
	public List<DocsDto> preservedDocs() throws Exception {
		return dao.preservedDocs();
	}

	@Override
	public int deleteDocRef(String s) throws Exception {
		return dao.deleteDocRef(s);
	}

	@Override
	public int deleteDoc(String s) throws Exception {
		return dao.deleteDoc(s);
	}
}
