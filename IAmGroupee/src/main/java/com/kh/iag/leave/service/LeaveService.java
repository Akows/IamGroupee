package com.kh.iag.leave.service;

import java.util.List;

import com.kh.iag.leave.entity.AlvOccurHistoryDto;
import com.kh.iag.leave.entity.LeaveDto;
import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.leave.entity.LvUsedListDto;
import com.kh.iag.leave.entity.PageVo;
import com.kh.iag.user.entity.UserDto;

public interface LeaveService {
	
	List<LvUsedListDto> getAllUsage(String userNo) throws Exception;

	List<LvUsedListDto> getAlvListCalen(String userNo) throws Exception;

	List<LvUsedListDto> getLvListCalen(String userNo) throws Exception;
	
	List<LvUsedListDto> getAlvList(String userNo, PageVo pageVoAlv) throws Exception;
	
	List<LvUsedListDto> getLvList(String userNo, PageVo pageVoLv) throws Exception;

	int getAlvRowCnt(String userNo) throws Exception;
	
	int getLvRowCnt(String userNo) throws Exception;

	List<LeaveDto> getLvTypeList() throws Exception;
	
	int addLvType(LeaveDto leaveDto) throws Exception;

	int delLvType(String lvCode) throws Exception;

	LeaveDto checkExist(LeaveDto leaveDto) throws Exception;

	List<LvInfoDto> getLvInfoList() throws Exception;

	LvInfoDto lvInfoDetail(int lvbNo) throws Exception;

	int lvbEnroll(LvInfoDto lvInfoDto) throws Exception;

	int getThisLvbNo(String title) throws Exception;

	LvInfoDto getThisLvbData(String lvbTitle) throws Exception;

	int lvbUpdate(LvInfoDto lvInfoDto) throws Exception;

	int lvbDelete(LvInfoDto lvInfoDto) throws Exception;

	List<UserDto> getAllUser() throws Exception;

	List<AlvOccurHistoryDto> getOccurHistory(String userNo) throws Exception;

	List<LvUsedListDto> getAlvUsageCal(String userNo) throws Exception;

	List<UserDto> getThisUser(String userNo) throws Exception;


}
