package com.kh.iag.leave.dao;

import java.util.List;

import com.kh.iag.leave.entity.LeaveDto;
import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.leave.entity.LvUsedListDto;

public interface LeaveDao {

	List<LvUsedListDto> getAlvList(String userNo) throws Exception;

	List<LvUsedListDto> getLvList(String userNo) throws Exception;

	int getAlvRowCnt(String userNo) throws Exception;

	List<LeaveDto> getLvTypeList() throws Exception;

	int addLvType(LeaveDto leaveDto) throws Exception;

	int delLvType(String lvCode) throws Exception;

	LeaveDto checkExist(LeaveDto leaveDto) throws Exception;

	List<LvInfoDto> getLvInfoList() throws Exception;

}
