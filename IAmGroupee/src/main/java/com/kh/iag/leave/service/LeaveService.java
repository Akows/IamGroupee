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

	List<UserDto> getAllUserAD(PageVo pageVo) throws Exception;

	List<AlvOccurHistoryDto> getOccurHistory(String userNo) throws Exception;

	List<LvUsedListDto> getAlvUsageCal(String userNo) throws Exception;

	UserDto getThisUser(String userNo) throws Exception;

	int iagAddAlvCount(String alvAddCount, String userNo) throws Exception;

	int alvOccurHistory(String alvAddCount, String userNo, String alvOccurReason) throws Exception;

	UserDto getAllAlvUsage(String userNo) throws Exception;

	List<UserDto> getThisUserAD(String searchByUserNo) throws Exception;

	List<UserDto> getThisDeptUserAD(String dept) throws Exception;

	int getRowCntAD() throws Exception;

	List<UserDto> getAllUserInfo() throws Exception;

	int checkOverEighty(String userNo, String start, String end) throws Exception;

	void resetIagUserAlv(String userNo) throws Exception;

	void resetAlvHistory(String userNo) throws Exception;

	void resetUsageLv(String userNo, String todayDate) throws Exception;

	int checkOccuredAlvToday(String userNo, String todayDate) throws Exception;

	int addAlvCount(String userNo, int createAlvCount) throws Exception;

	int addAlvHistory(String userNo, int createAlvCount) throws Exception;

	int checkOccurMlvToday(String userNo, String todayDate) throws Exception;

	int checkAttendAll(String userNo, String todayDate) throws Exception;

	int addMlvCount(String userNo) throws Exception;

	int addMlvHistory(String userNo) throws Exception;
	
}
