package com.kh.iag.attend.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendPageDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

public interface attendService 
{
	//메인페이지
		//근태 테이블 생성
		void attendtempdatainsert(AttendDTO attendDTO) throws Exception;
		void attendWTtempdatainsert(AttendWTDTO attendWTDTO) throws Exception;

		//메인페이지 정보 출력
		List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception;
		List<AttendDTO> getAttendNumandName(AttendDTO attendDTO) throws Exception;
		List<AttendDTO> getPreAttendInfo(AttendDTO attendDTO) throws Exception;
		List<AttendModDTO> getAttendModInfo(AttendModDTO attendModDTO) throws Exception;
		List<AttendWTDTO> getAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
		List<AttendWTDTO> getWTTWTInfo(AttendWTDTO attendWTDTO2) throws Exception;
		
		//춭퇴근처리
		void attendprocessIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
		void attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
		void attendprocessReIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
		void attendprocessReOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;

	//근태현황 조회페이지
		//캘린더
		
		//근태수정요청
		int attendModify(AttendModDTO attendmodDTO, HttpServletRequest req, MultipartFile file) throws Exception;
		int getAttendModCnt() throws Exception;
		
		//일일 근태현황조회
		List<AttendDTO> getAllAttendINfo(AttendDTO attendDTO) throws Exception;
		List<AttendWTDTO> getAllAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
		
		//일일 근태현황조회 페이징
		int getAttendStateCnt() throws Exception;
		List<AttendWTDTO> getWorktimeList(AttendPageDTO attendpageDTO, String userNo) throws Exception;
		
		//내 수정요청보기
		List<AttendModDTO> getMyModList(AttendModDTO attendModDTO) throws Exception;
		List<AttendModDTO> getModListSearch(AttendModDTO attendModDTO) throws Exception;
		int checkModReq(String attend_date) throws Exception;
		
		//반려사유 보기
		List<AttendModDTO> getrejectReason(String attend_mod_num) throws Exception;
		
	//근태관리 페이지
		//수정요청 조회
		List<AttendModDTO> getModList() throws Exception;
		
		//첨부파일 조회-출력
		List<AttendModDTO> getFile(String searchKey) throws Exception;
		
		//수정요청처리
		void approveManageOK(AttendModDTO attendModDTO) throws Exception;
		void approveManageNone(AttendModDTO attendModDTO) throws Exception;





		



	
	
	
	

	


}
