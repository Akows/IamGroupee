package com.kh.iag.leave.dao;

import java.util.List;

import com.kh.iag.leave.entity.LvInfoDto;

public interface LeaveDao {

	List<LvInfoDto> getLeaveList() throws Exception;

}
