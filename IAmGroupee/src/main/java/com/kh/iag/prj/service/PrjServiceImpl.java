package com.kh.iag.prj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.prj.dao.PrjDao;
import com.kh.iag.prj.entity.PrjDto;

@Service
public class PrjServiceImpl implements PrjService{

	@Autowired
	private PrjDao dao;

	@Override
	public int createPrj(PrjDto dto) throws Exception {
		return dao.createPrj(dto);
	}
}
