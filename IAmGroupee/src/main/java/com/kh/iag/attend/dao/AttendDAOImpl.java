package com.kh.iag.attend.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.attend.entity.AttendModDTO;

@Repository
public class AttendDAOImpl implements AttendDAO
{
	@Autowired
	private SqlSession ss;

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

}
