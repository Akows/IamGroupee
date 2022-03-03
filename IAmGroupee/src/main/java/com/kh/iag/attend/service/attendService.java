package com.kh.iag.attend.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kh.iag.attend.controller.AttendPageVo;
import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

public interface attendService 
{
	//근태 메인페이지
	List<AttendDTO> getAttendInfo() throws Exception;
	List<AttendModDTO> getAttendModInfo() throws Exception;
	List<AttendWTDTO> getAttendWTInfo() throws Exception;
	
	//근태 상태조회 - 근로상황 수정요청페이지
	int attendModify(AttendModDTO attendmodDTO, HttpServletRequest req) throws Exception;
	int getAttendModCnt() throws Exception;
	
	//근태관리
	List<AttendModDTO> getModList() throws Exception;
	List<AttendModDTO> getFile(String searchKey) throws Exception;
}
