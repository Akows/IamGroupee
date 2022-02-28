package com.kh.iag.ea.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.ea.dao.EADao;
import com.kh.iag.ea.entity.FormDto;

@Service
public class EAServiceImpl implements EAService {
	
	@Autowired
	private EADao dao;

	@Override
	public FormDto signupFormValue(FormDto dto) {
		return dao.signupFormValue(dto);
	}

}
