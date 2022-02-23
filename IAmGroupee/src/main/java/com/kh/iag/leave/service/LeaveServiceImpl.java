package com.kh.iag.leave.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.leave.dao.LeaveDao;
import com.kh.iag.leave.entity.LvInfoDto;

@Service
public class LeaveServiceImpl implements LeaveService {
	
	@Autowired
	private LeaveDao dao;

	@Override
	public void getLeaveList() throws Exception {
		List<LvInfoDto> result = dao.getLeaveList();
		
	}

	
	
}
