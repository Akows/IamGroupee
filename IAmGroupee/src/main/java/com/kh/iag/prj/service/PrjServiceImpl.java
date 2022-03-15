package com.kh.iag.prj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.prj.dao.PrjDao;
import com.kh.iag.prj.entity.PrjDto;
import com.kh.iag.resv.entity.PageVo;

@Service
public class PrjServiceImpl implements PrjService{

	@Autowired
	private PrjDao dao;
	
	
	@Override
	public int getMyPrjCnt(int departNo) throws Exception {
		return dao.getMyPrjCnt(departNo);
	}
	
	@Override
	public List<PrjDto> getPrjList(int departNo, PageVo vo) throws Exception {
		return dao.getPrjList(departNo, vo);
	}
	
	@Override
	public int createPrj(PrjDto dto) throws Exception {
		return dao.createPrj(dto);
	}

	@Override
	public String getUserNo(String name) throws Exception {
		return dao.getUserNo(name);
	}

	@Override
	public PrjDto viewPrj(int prjNo) throws Exception {
		return dao.viewPrj(prjNo);
	}

}
