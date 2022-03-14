package com.kh.iag.sch.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.sch.dao.ScheduleDao;
import com.kh.iag.sch.entity.SchDto;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao dao;
	
	@Override // 일정 db에 등록
	public void enrollSchedule(SchDto schDto) throws Exception {
		dao.enrollSchedule(schDto);
	}

	@Override // 개인일정
	public List<SchDto> getPersonalList(String userNo) throws Exception {
		return dao.getPersonalList(userNo);
	}

	@Override // 부서일정
	public List<SchDto> getDeptList(String userNo) throws Exception {
		return dao.getDeptList(userNo);
	}

	@Override // 전사일정
	public List<SchDto> getCorpList(String userNo) throws Exception {
		return dao.getCorpList(userNo);
	}

	@Override // 일정수정
	public void modifySch(SchDto modSchDto) throws Exception {
		dao.modifySch(modSchDto);
	}

}
