package com.kh.iag.attend.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

public interface AttendDAO 
{
	//근태관리 메인페이지
		//임시데이터 삽입
		void attendtempdatainsert(AttendDTO attendDTO);
		int getAttendSeq() throws Exception;
		void attendWTtempdatainsert(AttendWTDTO attendWTDTO);
	
		//메인페이지 정보 출력
		List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception;
		List<AttendDTO> getAttendNumandName(AttendDTO attendDTO) throws Exception;
		List<AttendDTO> getPreAttendInfo(AttendDTO attendDTO) throws Exception;
		List<AttendModDTO> getAttendModInfo(AttendModDTO attendModDTO) throws Exception;
		List<AttendWTDTO> getAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
		List<AttendWTDTO> getWTTWTInfo(AttendWTDTO attendWTDTO2)throws Exception;
	
		//출퇴근처리
		int getAttendWtSeq() throws Exception;
		void attendprocessIN(AttendWTDTO attendWTDTO);
		void attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req);
		void attendprocessReIN(AttendWTDTO attendWTDTO, HttpServletRequest req);
		void attendprocessReOUT(AttendWTDTO attendWTDTO, HttpServletRequest req);
		
	//근태현황 조회페이지
		//캘린더
		
		//근태현황 수정요청	
		int getAttendmodSeq() throws Exception;
		int insertattendmodify(AttendModDTO attendmodDTO) throws Exception;
		void uploadfile(AttendModDTO attendmodDTO) throws Exception;
	
		//일일 근태현황조회	
		List<AttendDTO> getAllAttendINfo(AttendDTO attendDTO) throws Exception;
		List<AttendWTDTO> getAllAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
		
	//근태관리 관리페이지
		//수정요청 조회	
		int getAttendModCnt() throws Exception;
		List<AttendModDTO> getModList() throws Exception;
		
		//첨부파일 조회-출력
		List<AttendModDTO> getFile(String searchKey) throws Exception;
		AttendModDTO downloadFile(String attach_file);
	
		//수정요청처리
		int approveManageOK(AttendModDTO attendModDTO) throws Exception;
		int approveManageNone(AttendModDTO attendModDTO) throws Exception;




	
	











}
