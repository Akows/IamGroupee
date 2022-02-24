package com.kh.iag.leave.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.leave.dao.LeaveDao;
import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.leave.entity.LvUsedListDto;

@Service
public class LeaveServiceImpl implements LeaveService {
	
	@Autowired
	private LeaveDao dao;

	@Override //
	public void getLvInfoList() throws Exception {
		List<LvInfoDto> result = dao.getLvInfoList();
		
	}

	@Override // 연차 사용대장
	public List<LvUsedListDto> getAlvList(String userNo) throws Exception {
		return dao.getAlvList(userNo);
	}

	@Override // 휴가 사용대장
	public List<LvUsedListDto> getLvList(String userNo) throws Exception {
		return dao.getLvList(userNo);
	}

	@Override
	public int getAlvRowCnt(String userNo) throws Exception {
		return dao.getAlvRowCnt(userNo);
	}

	
	
}
