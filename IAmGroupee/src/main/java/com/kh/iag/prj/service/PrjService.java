package com.kh.iag.prj.service;

import java.util.List;

import com.kh.iag.prj.entity.PrjDto;

public interface PrjService {

	List<PrjDto> getPrjList(int departNo) throws Exception;
	
	int createPrj(PrjDto dto) throws Exception;

	String getUserNo(String name) throws Exception;


}
