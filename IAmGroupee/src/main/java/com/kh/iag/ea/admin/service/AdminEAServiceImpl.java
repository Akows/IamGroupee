package com.kh.iag.ea.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.ea.admin.dao.AdminEADao;
import com.kh.iag.ea.entity.CategoryDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.PositionDto;
import com.kh.iag.ea.entity.SettingsDto;

@Service
public class AdminEAServiceImpl implements AdminEAService {

	@Autowired
	private AdminEADao dao;
	
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

}
