package com.kh.iag.leave.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.leave.entity.LvInfoDto;

@Repository
public class LeaveDaoImpl implements LeaveDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<LvInfoDto> getLeaveList() throws Exception {
		
		return session.selectList("leave.getlvInfoList");
	}

	
	
}
