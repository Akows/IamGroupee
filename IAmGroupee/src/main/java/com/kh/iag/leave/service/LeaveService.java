package com.kh.iag.leave.service;

import java.util.List;

import com.kh.iag.leave.entity.LvUsedListDto;

public interface LeaveService {

	void getLvInfoList() throws Exception;

	List<LvUsedListDto> getAlvList(String userNo) throws Exception;

	List<LvUsedListDto> getLvList(String userNo) throws Exception;

	int getAlvRowCnt(String userNo) throws Exception;

}
