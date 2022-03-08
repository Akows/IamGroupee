package com.kh.iag.attend.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

@Repository
public class AttendDAOImpl implements AttendDAO
{
	@Autowired
	private SqlSession ss;
	
	//���� ���������� �ӽõ����� ����
	@Override
	public void attendtempdatainsert(AttendDTO attendDTO) 
	{
		ss.insert("attend.attendtempdatainsert", attendDTO);	
	}
	
	@Override
	public int getAttendSeq() throws Exception 
	{
		return ss.selectOne("attend.getATseq");
	}

	@Override
	public void attendWTtempdatainsert(AttendWTDTO attendWTDTO) 
	{
		ss.insert("attend.attendWTtempdatainsert", attendWTDTO);	
	}

	
	//���¸���
	@Override
	public List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception 
	{
		return ss.selectList("attend.getAttendInfo", attendDTO);
	}
	
	@Override
	public List<AttendDTO> getPreAttendInfo(AttendDTO attendDTO) throws Exception 
	{
		return ss.selectList("attend.getPreAttendInfo", attendDTO);
	}

	@Override
	public List<AttendModDTO> getAttendModInfo(AttendModDTO attendModDTO) throws Exception 
	{
		return ss.selectList("attend.getAttendModInfo", attendModDTO);
	}

	@Override
	public List<AttendWTDTO> getAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception 
	{
		return ss.selectList("attend.getAttendWTInfo", attendWTDTO);
	}
	
	//���������
	@Override
	public int getAttendWtSeq() throws Exception 
	{
		return ss.selectOne("attend.getWTseq");
	}
	@Override
	public void attendprocessIN(AttendWTDTO attendWTDTO) 
	{
		ss.update("attend.attendprocessIN", attendWTDTO);	
	}

	@Override
	public void attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) 
	{
		ss.update("attend.attendprocessOUT", attendWTDTO);
	}
	
	
	//������ȸ
	@Override
	public int getAttendmodSeq() 
	{
		return ss.selectOne("attend.getreq");
	}

	@Override
	public int insertattendmodify(AttendModDTO attendmodDTO) throws Exception 
	{
		return ss.insert("attend.modreq", attendmodDTO);
	}

	@Override
	public void uploadfile(AttendModDTO attendmodDTO) throws Exception 
	{
		ss.update("attend.modfilereq", attendmodDTO);		
	}
	
	//���°���
	@Override
	public int getAttendModCnt() throws Exception
	{
		return ss.selectOne("attend.getAttendModCnt");
	}

	@Override
	public List<AttendModDTO> getModList() throws Exception 
	{
		return ss.selectList("attend.getModList");
	}

	@Override
	public List<AttendModDTO> getFile(String searchKey) throws Exception 
	{
		return ss.selectList("attend.getFile", searchKey);
	}

	@Override
	public AttendModDTO downloadFile(String attach_file) 
	{
		return ss.selectOne("attend.downFile", attach_file);
	}

	//������û ���� Ȥ�� ����
	@Override
	public int approveManageOK(AttendModDTO attendModDTO) throws Exception 
	{
		return ss.update("attend.approveManageOK", attendModDTO);
	}

	@Override
	public int approveManageNone(AttendModDTO attendModDTO) throws Exception 
	{
		return ss.update("attend.approveManageNone", attendModDTO);
	}










}