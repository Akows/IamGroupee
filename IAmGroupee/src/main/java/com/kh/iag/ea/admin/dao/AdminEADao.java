package com.kh.iag.ea.admin.dao;

import java.util.List;

import com.kh.iag.ea.entity.CategoryDto;
import com.kh.iag.ea.entity.DocsDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.PositionDto;
import com.kh.iag.ea.entity.SettingsDto;

public interface AdminEADao {

	SettingsDto checkInitialSettings() throws Exception;

	int insertInitialSettings1(SettingsDto dto) throws Exception;

	int insertInitialSettings2(SettingsDto dto) throws Exception;

	int insertInitialSettings3(SettingsDto dto) throws Exception;
	
	SettingsDto defaultSettings() throws Exception;

	List<PositionDto> positionValues() throws Exception;

	int updateSettings1(SettingsDto dto) throws Exception;

	int updateSettings2(SettingsDto dto) throws Exception;

	int updateSettings3(SettingsDto dto) throws Exception;

	List<CategoryDto> categoryValues() throws Exception;

	List<FormDto> formValues() throws Exception;

	int insertFormCategory() throws Exception;

	CategoryDto selectLatestFormCategory() throws Exception;

	int deleteFormCategory(String categoryNo) throws Exception;

	int insertForm(String categoryNo) throws Exception;

	FormDto selecLatestForm() throws Exception;

	int deleteForm(String formNo) throws Exception;

	int updateCategoryName(CategoryDto dto) throws Exception;

	int updateFormName(FormDto dto) throws Exception;

	FormDto formValue(FormDto dto) throws Exception;

	int editForm(FormDto dto) throws Exception;

	List<DocsDto> preservedDocs() throws Exception;

	int deleteDocRef(String s) throws Exception;

	int deleteDoc(String s) throws Exception;


}
