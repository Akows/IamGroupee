package com.kh.iag.ea.admin.dao;

import java.util.List;

import com.kh.iag.ea.entity.PositionDto;
import com.kh.iag.ea.entity.SettingsDto;

public interface AdminEADao {

	SettingsDto defaultSettings() throws Exception;

	List<PositionDto> positionValues() throws Exception;

}
