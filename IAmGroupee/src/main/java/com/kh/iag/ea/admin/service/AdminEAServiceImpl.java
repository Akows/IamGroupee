package com.kh.iag.ea.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.ea.admin.dao.AdminEADao;
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

}
