//package com.kh.iag.attend.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.kh.iag.attend.dao.AttendDAO;
//import com.kh.iag.attend.entity.AttendModDTO;
//
//@Service
//public class attendServiceImpl implements attendService
//{
//	@Autowired
//	private AttendDAO attendDAO;
//	
//	@Override
//	public int attendModify(AttendModDTO modDTO) 
//	{
//		int no = attendDAO.getAttendmodSeq();
//		
//		modDTO.setAttend_mod_num(no);
//		
//		int result = attendDAO.insertAttendMod(modDTO);
//
//		return result;
//	}
//	
//}
