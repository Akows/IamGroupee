package com.kh.iag.attend.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

public interface attendService 
{
	//근태관리 메인페이지
		//임시데이터 삽입
		void attendtempdatainsert(AttendDTO attendDTO) throws Exception;
		void attendWTtempdatainsert(AttendWTDTO attendWTDTO) throws Exception;

		//메인페이지 정보 출력
		List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception;
		List<AttendDTO> getAttendNumandName(AttendDTO attendDTO) throws Exception;
		List<AttendDTO> getPreAttendInfo(AttendDTO attendDTO) throws Exception;
		List<AttendModDTO> getAttendModInfo(AttendModDTO attendModDTO) throws Exception;
		List<AttendWTDTO> getAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
		List<AttendWTDTO> getWTTWTInfo(AttendWTDTO attendWTDTO2) throws Exception;
		
		//출퇴근처리
		void attendprocessIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
		void attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
		void attendprocessReIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
		void attendprocessReOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;

	
	//근태현황 조회페이지
		//캘린더
		
		//근태현황 수정요청
		int attendModify(AttendModDTO attendmodDTO, HttpServletRequest req, MultipartFile file) throws Exception;
		int getAttendModCnt() throws Exception;
		
		//일일 근태현황조회	
		List<AttendDTO> getAllAttendINfo(AttendDTO attendDTO) throws Exception;
		List<AttendWTDTO> getAllAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
		
	//근태관리 관리페이지
		//수정요청 조회
		List<AttendModDTO> getModList() throws Exception;
		
		//첨부파일 조회-출력
		List<AttendModDTO> getFile(String searchKey) throws Exception;
		
		//수정요청처리
		int approveManageOK(AttendModDTO attendModDTO) throws Exception;
		int approveManageNone(AttendModDTO attendModDTO) throws Exception;



	
	
	
	

	


}
