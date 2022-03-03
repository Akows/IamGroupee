package com.kh.iag.attend.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kh.iag.attend.controller.AttendPageVo;
import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

public interface attendService 
{
	//���� ����������
	List<AttendDTO> getAttendInfo() throws Exception;
	List<AttendModDTO> getAttendModInfo() throws Exception;
	List<AttendWTDTO> getAttendWTInfo() throws Exception;
	
	//���� ������ȸ - �ٷλ�Ȳ ������û������
	int attendModify(AttendModDTO attendmodDTO, HttpServletRequest req) throws Exception;
	int getAttendModCnt() throws Exception;
	
	//���°���
	List<AttendModDTO> getModList() throws Exception;
	List<AttendModDTO> getFile(String searchKey) throws Exception;
}
