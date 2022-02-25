package com.kh.iag.attend.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.iag.attend.dao.AttendDAO;
import com.kh.iag.attend.entity.AttendModDTO;

@Service
public class attendServiceImpl implements attendService
{
	@Autowired
	private AttendDAO attendDAO;

	@Override
	public int attendModify(AttendModDTO attendmodDTO, HttpServletRequest req) throws Exception 
	{
		int no = attendDAO.getAttendmodSeq();

		attendmodDTO.setAttend_mod_num(no);
		
		int result = attendDAO.insertattendmodify(attendmodDTO);
		

		
		MultipartFile mpfile = attendmodDTO.getFile();

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
}
