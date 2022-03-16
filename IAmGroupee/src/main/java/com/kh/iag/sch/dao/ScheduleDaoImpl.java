package com.kh.iag.sch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.sch.entity.SchDto;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{

	@Autowired
	private SqlSession session;

	@Override
	public void enrollSchedule(SchDto schDto) throws Exception {
		session.insert("sch.enrollSchedule", schDto);
	}

	@Override
	public List<SchDto> getPersonalList(String userNo) throws Exception {
		return session.selectList("sch.getPersonalList", userNo);
	}

	@Override
	public List<SchDto> getDeptList(String userNo) throws Exception {
		return session.selectList("sch.getDeptList", userNo);
	}

	@Override
	public List<SchDto> getCorpList(String userNo) throws Exception {
		return session.selectList("sch.getCorpList", userNo);
	}

	@Override
	public void modifySch(SchDto modSchDto) throws Exception {
		session.update("sch.modifySch", modSchDto);
	}

	@Override
	public void deleteSch(int schNo) throws Exception {
		session.delete("sch.deleteSch", schNo);
	}
	
	

}
