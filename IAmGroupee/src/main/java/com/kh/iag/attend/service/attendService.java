package com.kh.iag.attend.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

public interface attendService 
{
	//���°��� ����������
		//�ӽõ����� ����
		void attendtempdatainsert(AttendDTO attendDTO) throws Exception;
		void attendWTtempdatainsert(AttendWTDTO attendWTDTO) throws Exception;

		//���������� ���� ���
		List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception;
		List<AttendDTO> getAttendNumandName(AttendDTO attendDTO) throws Exception;
		List<AttendDTO> getPreAttendInfo(AttendDTO attendDTO) throws Exception;
		List<AttendModDTO> getAttendModInfo(AttendModDTO attendModDTO) throws Exception;
		List<AttendWTDTO> getAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
		List<AttendWTDTO> getWTTWTInfo(AttendWTDTO attendWTDTO2) throws Exception;
		
		//�����ó��
		void attendprocessIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
		void attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
		void attendprocessReIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;
		void attendprocessReOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception;

	
	//������Ȳ ��ȸ������
		//Ķ����
		
		//������Ȳ ������û
		int attendModify(AttendModDTO attendmodDTO, HttpServletRequest req, MultipartFile file) throws Exception;
		int getAttendModCnt() throws Exception;
		
		//���� ������Ȳ��ȸ	
		List<AttendDTO> getAllAttendINfo(AttendDTO attendDTO) throws Exception;
		List<AttendWTDTO> getAllAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
		
	//���°��� ����������
		//������û ��ȸ
		List<AttendModDTO> getModList() throws Exception;
		
		//÷������ ��ȸ-���
		List<AttendModDTO> getFile(String searchKey) throws Exception;
		
		//������ûó��
		void approveManageOK(AttendModDTO attendModDTO) throws Exception;
		void approveManageNone(AttendModDTO attendModDTO) throws Exception;



	
	
	
	

	


}
