package com.kh.iag.attend.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.attend.controller.AttendPageVo;
import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

@Repository
public class AttendDAOImpl implements AttendDAO
{
	@Autowired
	private SqlSession ss;
	
	//근태메인
	@Override
	public List<AttendDTO> getAttendInfo() throws Exception 
	{
		return ss.selectList("attend.getAttendInfo");
	}

	@Override
	public List<AttendModDTO> getAttendModInfo() throws Exception 
	{
		return ss.selectList("attend.getAttendModInfo");
	}

	@Override
	public List<AttendWTDTO> getAttendWTInfo() throws Exception 
	{
		return ss.selectList("attend.getAttendWTInfo");
	}
	
	//근태조회
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
	
	//근태관리
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



}