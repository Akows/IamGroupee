package com.kh.iag.sch.service;

import java.util.List;

import com.kh.iag.sch.entity.SchDto;

public interface ScheduleService {

	void enrollSchedule(SchDto schDto) throws Exception;

	List<SchDto> getPersonalList(String userNo) throws Exception;

	List<SchDto> getDeptList(String userNo) throws Exception;

	List<SchDto> getCorpList(String userNo) throws Exception;

	void modifySch(SchDto modSchDto) throws Exception;

	void deleteSch(int schNo) throws Exception;
	
}
