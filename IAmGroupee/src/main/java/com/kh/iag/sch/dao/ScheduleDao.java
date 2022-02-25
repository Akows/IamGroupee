package com.kh.iag.sch.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.iag.sch.entity.SchDto;

@Repository
public class ScheduleDao {
	
	@Inject
	private SqlSession ss;

	public List<SchDto> showSchedule() throws Exception {

		return ss.selectList("schedule.showSchedule");
	}

	public void addSchedule(SchDto dto) throws Exception {
		
		ss.insert("schedule.addSchedule", dto);
		
	}

}
