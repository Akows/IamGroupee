package com.kh.iag.prj.dao;

import java.util.List;

import com.kh.iag.prj.entity.CommDto;
import com.kh.iag.prj.entity.FileDto;
import com.kh.iag.prj.entity.PrjDto;
import com.kh.iag.prj.entity.PrjReportDto;
import com.kh.iag.resv.entity.PageVo;

public interface PrjDao {

	int getMyPrjCnt(int departNo) throws Exception;;
	
	List<PrjDto> getPrjList(int departNo, PageVo vo) throws Exception;
	
	int createPrj(PrjDto dto) throws Exception;

	String getUserNo(String name) throws Exception;

	PrjDto viewPrj(int prjNo) throws Exception;

	List<PrjReportDto> getReportList(int prjNo) throws Exception;
	
	//글 작성
	int post(PrjReportDto dto) throws Exception;

	Object postS(PrjReportDto dto);
	
	void uploadFile(FileDto dto) throws Exception;

	int insertComm(CommDto dto) throws Exception;

	int gCnt(int prjNo) throws Exception;

	int cCnt(int prjNo) throws Exception;

	int wCnt(int prjNo) throws Exception;

	int allCnt(int prjNo) throws Exception;
	
	List<PrjReportDto> selectList(int prjNo, String reportType) throws Exception;

	List<PrjReportDto> eventList(int departNo) throws Exception;





}
