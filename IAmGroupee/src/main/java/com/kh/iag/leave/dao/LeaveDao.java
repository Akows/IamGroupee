package com.kh.iag.leave.dao;

import java.util.List;

import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.leave.entity.LvUsedListDto;

public interface LeaveDao {

	List<LvInfoDto> getLvInfoList() throws Exception;

	List<LvUsedListDto> getAlvList(String userNo) throws Exception;

	List<LvUsedListDto> getLvList(String userNo) throws Exception;

	int getAlvRowCnt(String userNo) throws Exception;

}
