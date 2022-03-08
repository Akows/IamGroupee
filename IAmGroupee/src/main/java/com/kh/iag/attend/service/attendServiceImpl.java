package com.kh.iag.attend.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.iag.attend.controller.AttendPageVo;
import com.kh.iag.attend.dao.AttendDAO;
import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

@Service
public class attendServiceImpl implements attendService
{
	@Autowired
	private AttendDAO attendDAO;
	
	//근태 메인페이지 임시데이터 삽입
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
	
	
	//근태 메인페이지
	@Override
	public List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception 
	{
		return attendDAO.getAttendInfo(attendDTO);
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
	
	//근태 출퇴근처리
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
	
	//근태조회
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
	
	//근태관리
	@Override
	public int getAttendModCnt() throws Exception 
	{
		return attendDAO.getAttendModCnt();
	}

	@Override
	public List<AttendModDTO> getModList() throws Exception 
	{
		return attendDAO.getModList();
	}

	@Override
	public List<AttendModDTO> getFile(String searchKey) throws Exception 
	{
		return attendDAO.getFile(searchKey);
	}
	
	//수정요청 승인 혹은 거절
	@Override
	public int approveManageOK(AttendModDTO attendModDTO) throws Exception 
	{
		return attendDAO.approveManageOK(attendModDTO);
	}

	@Override
	public int approveManageNone(AttendModDTO attendModDTO) throws Exception 
	{
		return attendDAO.approveManageNone(attendModDTO);
	}



}
