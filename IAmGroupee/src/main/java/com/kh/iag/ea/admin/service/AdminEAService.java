package com.kh.iag.ea.admin.service;

import java.util.List;

import com.kh.iag.ea.entity.CategoryDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.PositionDto;
import com.kh.iag.ea.entity.SettingsDto;

public interface AdminEAService {

	SettingsDto defaultSettings() throws Exception;

	List<PositionDto> positionValues() throws Exception;

	int updateSettings1(SettingsDto dto) throws Exception;

	int updateSettings2(SettingsDto dto) throws Exception;

	int updateSettings3(SettingsDto dto) throws Exception;

	List<CategoryDto> categoryValues() throws Exception;

	List<FormDto> formValues() throws Exception;
	
}
