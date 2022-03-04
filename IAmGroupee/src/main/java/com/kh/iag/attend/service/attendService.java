package com.kh.iag.attend.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.iag.attend.controller.AttendPageVo;
import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

public interface attendService 
{
	//근태 메인페이지
	List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception;
	List<AttendModDTO> getAttendModInfo(AttendModDTO attendModDTO) throws Exception;
	List<AttendWTDTO> getAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
	
	//근태 출퇴근처리
	int attendprocessIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
	void attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
	
	
	//근태 상태조회 - 근로상황 수정요청페이지
	int attendModify(AttendModDTO attendmodDTO, HttpServletRequest req, MultipartFile file) throws Exception;
	int getAttendModCnt() throws Exception;
	
	//근태관리
	List<AttendModDTO> getModList() throws Exception;
	List<AttendModDTO> getFile(String searchKey) throws Exception;
	
	//수정요청 승인 혹은 거절
	int approveManageOK(AttendModDTO attendModDTO) throws Exception;
	int approveManageNone(AttendModDTO attendModDTO) throws Exception;
	
}
