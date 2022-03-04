package com.kh.iag.sch.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.sch.dao.ScheduleDao;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao dao;
	
	@Override
	public int insert_schedule(HashMap<String, Object> m) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("m", m);

		return dao.insert_schedule(map);
	}

}
