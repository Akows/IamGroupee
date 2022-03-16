package com.kh.iag.attend.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.iag.attend.dao.AttendDAO;
import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendPageDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

@Service
public class attendServiceImpl implements attendService
{
	@Autowired
	private AttendDAO attendDAO;
	
	//메인페이지
		//근태 테이블 생성
		@Override
		@Transactional
		public void attendtempdatainsert(AttendDTO attendDTO) throws Exception 
		{
			int no = attendDAO.getAttendSeq();
			attendDTO.setAttend_num(no);
	
			attendDAO.attendtempdatainsert(attendDTO);
		}
	
		@Override
		@Transactional
		public void attendWTtempdatainsert(AttendWTDTO attendWTDTO) throws Exception 
		{
			attendDAO.attendWTtempdatainsert(attendWTDTO);
		}
		
		@Override
		public int attendDataCnt(AttendDTO attendDTO) throws Exception 
		{
			return attendDAO.attendDataCnt(attendDTO);
		}
	
		//메인페이지 정보 출력
		@Override
		public List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception 
		{
			return attendDAO.getAttendInfo(attendDTO);
		}

		@Override
		public List<AttendDTO> getAttendNumandName(AttendDTO attendDTO) throws Exception 
		{
			return attendDAO.getAttendNumandName(attendDTO);
		}
		
		@Override
		public List<AttendDTO> getPreAttendInfo(AttendDTO attendDTO) throws Exception 
		{
			return attendDAO.getPreAttendInfo(attendDTO);
		}

		@Override
		public List<AttendModDTO> getAttendModInfo(AttendModDTO attendModDTO) throws Exception
		{
			return attendDAO.getAttendModInfo(attendModDTO);
		}

		@Override
		public List<AttendWTDTO> getAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception
		{
			return attendDAO.getAttendWTInfo(attendWTDTO);
		}

		@Override
		public List<AttendWTDTO> getWTTWTInfo(AttendWTDTO attendWTDTO2) throws Exception 
		{
			return attendDAO.getWTTWTInfo(attendWTDTO2);
		}
		
		
		//춭퇴근처리
		@Override
		@Transactional
		public void attendprocessIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception 
		{
			int no = attendDAO.getAttendWtSeq();
			attendWTDTO.setWorktime_num(no);
			
			attendDAO.attendprocessIN(attendWTDTO);
		}

		@Override
		@Transactional
		public void attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception 
		{
			attendDAO.attendprocessOUT(attendWTDTO, req);
		}
		
		@Override
		@Transactional
		public void attendprocessReIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception 
		{
			attendDAO.attendprocessReIN(attendWTDTO, req);
		}
		
		@Override
		public void attendprocessReOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception 
		{
			attendDAO.attendprocessReOUT(attendWTDTO, req);
		}

	//근태현황 조회페이지
		//캘린더
		
		//근태수정요청
		@Override
		public int attendModify(AttendModDTO attendmodDTO, HttpServletRequest req, MultipartFile mpfile) throws Exception 
		{
			int no = attendDAO.getAttendmodSeq();
			attendmodDTO.setAttend_mod_num(no);
			
			attendmodDTO.setAttach_file_size(mpfile.getSize());
			
			int result = attendDAO.insertattendmodify(attendmodDTO);

			mpfile = attendmodDTO.getFile();

			if(!mpfile.isEmpty()) 
			{	
				String fileName = System.currentTimeMillis() + "_" + mpfile.getOriginalFilename();
				attendmodDTO.setAttach_file(fileName);
				
				String path = req.getServletContext().getRealPath("/resources/upload/files/");
				
				File file = new File(path + fileName);
				mpfile.transferTo(file);
				
				attendDAO.uploadfile(attendmodDTO);
			}

			return result;
		}

		@Override
		public int getAttendModCnt() throws Exception 
		{
			return attendDAO.getAttendModCnt();
		}
		
		@Override
		public String getWorkCheck(String attend_date) throws Exception 
		{
			return attendDAO.getWorkCheck(attend_date);
		}

		
		//일일 근태현황조회	
		@Override
		public List<AttendDTO> getAllAttendINfo(AttendDTO attendDTO) throws Exception 
		{
			return attendDAO.getAllAttendINfo(attendDTO);
		}

		@Override
		public List<AttendWTDTO> getAllAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception 
		{
			return attendDAO.getAllAttendWTInfo(attendWTDTO);
		}
		
		//일일 근태현황조회 페이징
		@Override
		public int getAttendStateCnt() throws Exception 
		{
			return attendDAO.getAttendStateCnt();
		}
		@Override
		public List<AttendWTDTO> getWorktimeList(AttendPageDTO attendpageDTO, String userNo) throws Exception 
		{
			return attendDAO.getWorktimeList(attendpageDTO, userNo);
		}
		
		//내 수정요청보기
		@Override
		public List<AttendModDTO> getMyModList(AttendModDTO attendModDTO) throws Exception
		{
			return attendDAO.getMyModList(attendModDTO);
		}

		@Override
		public List<AttendModDTO> getModListSearch(AttendModDTO attendModDTO) throws Exception 
		{
			return attendDAO.getModListSearch(attendModDTO);
		}
		@Override
		public int checkModReq(String attend_date) throws Exception 
		{
			return attendDAO.checkModReq(attend_date);
		}

		
		
		//반려사유 보기
		@Override
		public List<AttendModDTO> getrejectReason(String attend_mod_num) throws Exception 
		{
			return attendDAO.getrejectReason(attend_mod_num);
		}

	
	//근태관리 페이지
		//수정요청 조회
		@Override
		public List<AttendModDTO> getModList() throws Exception 
		{
			return attendDAO.getModList();
		}
		
		//첨부파일 조회-출력
		@Override
		public List<AttendModDTO> getFile(String searchKey) throws Exception 
		{
			return attendDAO.getFile(searchKey);
		}
		
		//수정요청처리
		@Override
		public void approveManageOK(AttendModDTO attendModDTO) throws Exception 
		{
			attendDAO.approveManageOK(attendModDTO);
		}

		@Override
		public void approveManageNone(AttendModDTO attendModDTO) throws Exception 
		{
			attendDAO.approveManageNone(attendModDTO);
		}
























}
