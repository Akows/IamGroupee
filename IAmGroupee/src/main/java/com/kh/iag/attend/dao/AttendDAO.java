package com.kh.iag.attend.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

public interface AttendDAO 
{
	//���°��� ����������
		//�ӽõ����� ����
		void attendtempdatainsert(AttendDTO attendDTO);
		int getAttendSeq() throws Exception;
		void attendWTtempdatainsert(AttendWTDTO attendWTDTO);
	
		//���������� ���� ���
		List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception;
		List<AttendDTO> getAttendNumandName(AttendDTO attendDTO) throws Exception;
		List<AttendDTO> getPreAttendInfo(AttendDTO attendDTO) throws Exception;
		List<AttendModDTO> getAttendModInfo(AttendModDTO attendModDTO) throws Exception;
		List<AttendWTDTO> getAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
		List<AttendWTDTO> getWTTWTInfo(AttendWTDTO attendWTDTO2)throws Exception;
	
		//�����ó��
		int getAttendWtSeq() throws Exception;
		void attendprocessIN(AttendWTDTO attendWTDTO);
		void attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req);
		void attendprocessReIN(AttendWTDTO attendWTDTO, HttpServletRequest req);
		void attendprocessReOUT(AttendWTDTO attendWTDTO, HttpServletRequest req);
		
	//������Ȳ ��ȸ������
		//Ķ����
		
		//������Ȳ ������û	
		int getAttendmodSeq() throws Exception;
		int insertattendmodify(AttendModDTO attendmodDTO) throws Exception;
		void uploadfile(AttendModDTO attendmodDTO) throws Exception;
	
		//���� ������Ȳ��ȸ	
		List<AttendDTO> getAllAttendINfo(AttendDTO attendDTO) throws Exception;
		List<AttendWTDTO> getAllAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
		
	//���°��� ����������
		//������û ��ȸ	
		int getAttendModCnt() throws Exception;
		List<AttendModDTO> getModList() throws Exception;
		
		//÷������ ��ȸ-���
		List<AttendModDTO> getFile(String searchKey) throws Exception;
		AttendModDTO downloadFile(String attach_file);
	
		//������ûó��
		void approveManageOK(AttendModDTO attendModDTO) throws Exception;
		void approveManageNone(AttendModDTO attendModDTO) throws Exception;




	
	











}
