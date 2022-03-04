package com.kh.iag.attend.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

public interface AttendDAO 
{
	//���� ����
	List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception;
	List<AttendModDTO> getAttendModInfo(AttendModDTO attendModDTO) throws Exception;
	List<AttendWTDTO> getAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception;
	
	//���� �����
	int getAttendWtSeq() throws Exception;
	int attendprocessIN(AttendWTDTO attendWTDTO);
	void attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req);

	//���� ��ȸ
	int getAttendmodSeq() throws Exception;
	int insertattendmodify(AttendModDTO attendmodDTO) throws Exception;
	void uploadfile(AttendModDTO attendmodDTO) throws Exception;
	
	//���� ����
	int getAttendModCnt() throws Exception;
	List<AttendModDTO> getModList() throws Exception;
	List<AttendModDTO> getFile(String searchKey) throws Exception;
	AttendModDTO downloadFile(String attach_file);
	
	//������û ���� Ȥ�� ����
	int approveManageOK(AttendModDTO attendModDTO) throws Exception;;
	int approveManageNone(AttendModDTO attendModDTO) throws Exception;







}
