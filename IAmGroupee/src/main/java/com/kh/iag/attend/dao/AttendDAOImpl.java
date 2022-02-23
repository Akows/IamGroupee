package com.kh.iag.attend.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.iag.attend.entity.AttendModDTO;

public class AttendDAOImpl implements AttendDAO
{
	@Autowired
	private SqlSession ss;

	@Override
	public int getAttendmodSeq() 
	{
		return ss.selectOne(null);
	}

	@Override
	public int insertAttendMod(AttendModDTO modDTO) 
	{
		return ss.insert(null, modDTO);
	}

}
