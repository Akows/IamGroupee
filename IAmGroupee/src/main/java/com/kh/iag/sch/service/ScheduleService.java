package com.kh.iag.sch.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.iag.sch.dao.ScheduleDao;
import com.kh.iag.sch.entity.SchDto;

@Service
public class ScheduleService {

	@Inject
	private ScheduleDao dao;
	
	public List<SchDto> showSchedule() throws Exception {
		
		return dao.showSchedule();
	}

	public void addSchedule(SchDto dto) throws Exception {
		
		dao.addSchedule(dto);
		
	}

}
