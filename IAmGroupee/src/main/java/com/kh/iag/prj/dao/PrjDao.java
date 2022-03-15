package com.kh.iag.prj.dao;

import java.util.List;

import com.kh.iag.prj.entity.PrjDto;
import com.kh.iag.resv.entity.PageVo;

public interface PrjDao {

	int getMyPrjCnt(int departNo) throws Exception;;
	
	List<PrjDto> getPrjList(int departNo, PageVo vo) throws Exception;
	
	int createPrj(PrjDto dto) throws Exception;

	String getUserNo(String name) throws Exception;

	PrjDto viewPrj(int prjNo) throws Exception;



}
