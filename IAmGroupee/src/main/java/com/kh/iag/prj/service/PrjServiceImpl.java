package com.kh.iag.prj.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.prj.dao.PrjDao;
import com.kh.iag.prj.entity.CommDto;
import com.kh.iag.prj.entity.FileDto;
import com.kh.iag.prj.entity.PrjDto;
import com.kh.iag.prj.entity.PrjReportDto;
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
		String[] parts = dto.getPeriod().split("~");
		String start = parts[0]; 
		String end = parts[1];
    
		dto.setStartDate(start);
		dto.setEndDate(end);
		
		if(dto.getActivateYn() != null) {
			dto.setActivateYn("Y");
		}else {
			dto.setActivateYn("N");
		}
		
		if(dto.getOpenYn() != null) {
			dto.setOpenYn("Y");
		}else {
			dto.setOpenYn("N");
		}
		
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

	@Override
	public List<PrjReportDto> getReportList(int prjNo) throws Exception {
		return dao.getReportList(prjNo);
	}
	
	@Override
	public int post(PrjReportDto dto) throws Exception {
		return dao.post(dto);
	}

	@Override
	public void uploadFile(FileDto dto) throws Exception {
		dao.uploadFile(dto);
	}

	@Override
	public int insertComm(CommDto dto) throws Exception {
		return dao.insertComm(dto);
	}




}
