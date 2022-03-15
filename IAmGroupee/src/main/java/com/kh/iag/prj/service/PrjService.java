package com.kh.iag.prj.service;

import java.util.List;

import com.kh.iag.prj.entity.PrjDto;
import com.kh.iag.resv.entity.PageVo;

public interface PrjService {

	//메인페이지
	int getMyPrjCnt(int departNo) throws Exception;;
	
	List<PrjDto> getPrjList(int departNo, PageVo vo) throws Exception;
	
	int createPrj(PrjDto dto) throws Exception;

	String getUserNo(String name) throws Exception;

	//상세페이지
	PrjDto viewPrj(int prjNo) throws Exception;


}
