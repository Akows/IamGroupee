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
	//���� ����������
	List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception;
	List<AttendModDTO> getAttendModInfo(AttendModDTO attendModDTO) throws Exception;
	List<AttendWTDTO> getAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
	
	//���� �����ó��
	int attendprocessIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
	void attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
	
	
	//���� ������ȸ - �ٷλ�Ȳ ������û������
	int attendModify(AttendModDTO attendmodDTO, HttpServletRequest req, MultipartFile file) throws Exception;
	int getAttendModCnt() throws Exception;
	
	//���°���
	List<AttendModDTO> getModList() throws Exception;
	List<AttendModDTO> getFile(String searchKey) throws Exception;
	
	//������û ���� Ȥ�� ����
	int approveManageOK(AttendModDTO attendModDTO) throws Exception;
	int approveManageNone(AttendModDTO attendModDTO) throws Exception;
	
}
