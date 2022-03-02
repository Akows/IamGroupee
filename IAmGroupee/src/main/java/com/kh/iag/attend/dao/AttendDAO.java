package com.kh.iag.attend.dao;

import java.util.List;

import com.kh.iag.attend.controller.AttendPageVo;
import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

public interface AttendDAO 
{
	//근태 메인
	List<AttendDTO> getAttendInfo() throws Exception;
	List<AttendModDTO> getAttendModInfo() throws Exception;
	List<AttendWTDTO> getAttendWTInfo() throws Exception;

	//근태 조회
	int getAttendmodSeq() throws Exception;
	int insertattendmodify(AttendModDTO attendmodDTO) throws Exception;
	void uploadfile(AttendModDTO attendmodDTO) throws Exception;
	
	//근태 관리
	int getAttendModCnt() throws Exception;
	List<AttendModDTO> getModList() throws Exception;
	List<AttendModDTO> getFile() throws Exception;





}
