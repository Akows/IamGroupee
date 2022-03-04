package com.kh.iag.sch.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{

	@Autowired
	private SqlSession ss;
	
	@Override
	public int insert_schedule(HashMap<String, Object> map) {
		
		return ss.insert("schedule.insert_schedule", map);
		
	}

}
