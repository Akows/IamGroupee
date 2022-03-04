package com.kh.iag.attend.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

public interface AttendDAO 
{
	//근태 메인
	List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception;
	List<AttendModDTO> getAttendModInfo(AttendModDTO attendModDTO) throws Exception;
	List<AttendWTDTO> getAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
	
	//근태 출퇴근
	int getAttendWtSeq() throws Exception;
	int attendprocessIN(AttendWTDTO attendWTDTO);
	void attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req);

	//근태 조회
	int getAttendmodSeq() throws Exception;
	int insertattendmodify(AttendModDTO attendmodDTO) throws Exception;
	void uploadfile(AttendModDTO attendmodDTO) throws Exception;
	
	//근태 관리
	int getAttendModCnt() throws Exception;
	List<AttendModDTO> getModList() throws Exception;
	List<AttendModDTO> getFile(String searchKey) throws Exception;
	AttendModDTO downloadFile(String attach_file);
	
	//수정요청 승인 혹은 거절
	int approveManageOK(AttendModDTO attendModDTO) throws Exception;;
	int approveManageNone(AttendModDTO attendModDTO) throws Exception;







}
