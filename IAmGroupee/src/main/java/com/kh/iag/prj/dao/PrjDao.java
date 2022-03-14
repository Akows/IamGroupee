package com.kh.iag.prj.dao;

import java.util.List;

import com.kh.iag.prj.entity.PrjDto;

public interface PrjDao {

	List<PrjDto> getPrjList(int departNo) throws Exception;
	
	int createPrj(PrjDto dto) throws Exception;

	String getUserNo(String name) throws Exception;


}
