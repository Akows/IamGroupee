package com.kh.iag.leave.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.leave.entity.AlvOccurHistoryDto;
import com.kh.iag.leave.entity.LeaveDto;
import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.leave.entity.LvUsedListDto;
import com.kh.iag.leave.entity.PageVo;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class LeaveDaoImpl implements LeaveDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<LvUsedListDto> getAllUsage(String userNo) throws Exception {
		return session.selectList("leave.getAllUsage", userNo);
	}
	
	@Override
	public List<LvUsedListDto> getAlvListCalen(String userNo) throws Exception {
		return session.selectList("leave.getAlvListCalen", userNo);
	}
	
	@Override
	public List<LvUsedListDto> getLvListCalen(String userNo) throws Exception {
		return session.selectList("leave.getLvListCalen", userNo);
	}

	@Override
	public List<LvUsedListDto> getAlvList(String userNo, PageVo pageVoAlv) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("userNo", userNo);
        map.put("pageVoAlv", pageVoAlv);
		return session.selectList("leave.getAlvList", map);
	}

	@Override
	public List<LvUsedListDto> getLvList(String userNo, PageVo pageVoLv) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("userNo", userNo);
        map.put("pageVoAlv", pageVoLv);
		return session.selectList("leave.getLvList", map);
	}

	@Override
	public int getAlvRowCnt(String userNo) throws Exception {
		int result = session.selectOne("leave.getAlvRowCnt", userNo);
		return result;
	}
	
	@Override
	public int getLvRowCnt(String userNo) throws Exception {
		return session.selectOne("leave.getLvRowCnt", userNo);
	}

	@Override
	public List<LeaveDto> getLvTypeList() throws Exception {
		return session.selectList("leave.getLvTypeList");
	}

	@Override
	public int addLvType(LeaveDto leaveDto) throws Exception {
		return session.insert("leave.addLvType", leaveDto);
	}

	@Override
	public int delLvType(String lvCode) throws Exception {
		return session.delete("leave.delLvType", lvCode);
	}

	@Override
	public LeaveDto checkExist(LeaveDto leaveDto) throws Exception {
		return session.selectOne("leave.checkExist", leaveDto);
	}

	@Override
	public List<LvInfoDto> getLvInfoList() throws Exception {
		return session.selectList("leave.getLvInfoList");
	}

	@Override
	public LvInfoDto lvInfoDetail(int lvbNo) throws Exception {
		return session.selectOne("leave.lvInfoDetail", lvbNo);
	}

	@Override
	public int lvbEnroll(LvInfoDto lvInfoDto) throws Exception {
		return session.insert("leave.lvbEnroll", lvInfoDto);
	}

	@Override
	public int getThisLvbNo(String title) throws Exception {
		return session.selectOne("leave.getThisLvbNo", title);
	}

	@Override
	public LvInfoDto getThisLvbData(String lvbTitle) throws Exception {
		return session.selectOne("leave.getThisLvbData", lvbTitle);
	}

	@Override
	public int lvbUpdate(LvInfoDto lvInfoDto) throws Exception {
		return session.update("leave.lvbUpdate", lvInfoDto);
	}

	@Override
	public int lvbDelete(LvInfoDto lvInfoDto) throws Exception {
		return session.update("leave.lvbDelete", lvInfoDto);
	}

	@Override
	public List<UserDto> getAllUserAD(PageVo pageVo) throws Exception {
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pageVo.getStartRow());
		pageMap.put("endRow", pageVo.getEndRow());
		return session.selectList("leave.getAllUserAD", pageMap);
	}

	@Override
	public List<AlvOccurHistoryDto> getOccurHistory(String userNo) throws Exception {
		return session.selectList("leave.getOccurHistory", userNo);
	}

	@Override
	public List<LvUsedListDto> getAlvUsageCal(String userNo) throws Exception {
		return session.selectList("leave.getAlvUsageCal", userNo);
	}

	@Override
	public UserDto getThisUser(String userNo) throws Exception {
		return session.selectOne("leave.getThisUser", userNo);
	}

	@Override
	public int iagAddAlvCount(String alvAddCount, String userNo) throws Exception {
		Map<String, Object> iagAdd = new HashMap<String, Object>();
		iagAdd.put("alvAddCount", alvAddCount);
		iagAdd.put("userNo", userNo);
		return session.update("leave.iagAddAlvCount", iagAdd);
	}

	@Override
	public int alvOccurHistory(String alvAddCount, String userNo, String alvOccurReason) throws Exception {
		Map<String, Object> history = new HashMap<String, Object>();
		history.put("alvOccurCount", alvAddCount);
		history.put("userNo", userNo);
		history.put("alvOccurReason", alvOccurReason);
		return session.insert("leave.insertOccurHistory", history);
	}

	@Override
	public UserDto getAllAlvUsage(String userNo) throws Exception {
		return session.selectOne("leave.getAllAlvUsage", userNo);
	}

	@Override
	public List<UserDto> getThisUserAD(String searchByUserNo) throws Exception {
		return session.selectList("leave.getThisUser", searchByUserNo);
	}

	@Override
	public List<UserDto> getThisDeptUserAD(String dept) throws Exception {
		int departmentNo = Integer.parseInt(dept);
		return session.selectList("leave.getThisDeptUserAD", departmentNo);
	}

	@Override
	public int getRowCntAD() throws Exception {
		return session.selectOne("leave.getRowCntAD");
	}

	@Override
	public List<UserDto> getAllUserInfo() throws Exception {
		return session.selectList("leave.getAllUserInfo");
	}

//	@Override
//	public int Test(String date) throws Exception {
//		return session.insert("leave.Test", date);
//	}
	@Override
	public int checkOverEighty(String userNo, String start, String end) throws Exception {
		Map<String, Object> checkOverEighty = new HashMap<String, Object>();
		checkOverEighty.put("userNo", userNo);
		checkOverEighty.put("start", start);
		checkOverEighty.put("end", end);
		return session.selectOne("leave.checkOverEighty", checkOverEighty);
	}

	@Override
	public int resetIagUserAlv(String userNo) throws Exception {
		int result = 0;
		int count = session.update("leave.resetIagUserAlv", userNo);
		log.info(String.valueOf(count));
		log.info(String.valueOf(userNo));

		if (count>0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int resetAlvHistory(String userNo) throws Exception {
		int result = 0;
		int count = session.delete("leave.resetAlvHistory", userNo);
		log.info(String.valueOf(count));
		log.info(String.valueOf(userNo));

		if (count>0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int resetUsageLv(String userNo, String todayDate) throws Exception {
		int result = 0;
		Map<String, Object> resetUsageLv = new HashMap<String, Object>();
		resetUsageLv.put("userNo", userNo);
		resetUsageLv.put("todayDate", todayDate);
		int count = session.update("leave.resetUsageLv", resetUsageLv);
		log.info(String.valueOf(count));
		log.info(String.valueOf(userNo));
		
		if (count>0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int checkOccuredAlvToday(String userNo, String todayDate) throws Exception {
		int result = 0;
		Map<String, Object> checkOccuredAlvToday = new HashMap<String, Object>();
		checkOccuredAlvToday.put("userNo", userNo);
		checkOccuredAlvToday.put("todayDate", todayDate);
		int count = session.selectOne("leave.checkOccuredAlvToday", checkOccuredAlvToday);
		log.info(String.valueOf(count));
		log.info(String.valueOf(userNo));

		if (count>0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int createAlvCount(String userNo, int createAlvCount) throws Exception {
		int result = 0;
		Map<String, Object> addAlvCount = new HashMap<String, Object>();
		addAlvCount.put("userNo", userNo);
		addAlvCount.put("createAlvCount", createAlvCount);
		int count = session.update("leave.createAlvCount", addAlvCount);
		log.info(String.valueOf(count));
		log.info(String.valueOf(userNo));
		if (count>0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int addAlvHistory(String userNo, int createAlvCount) throws Exception {
		int result = 0;
		Map<String, Object> addAlvHistory = new HashMap<String, Object>();
		addAlvHistory.put("userNo", userNo);
		addAlvHistory.put("createAlvCount", createAlvCount);
		int count = session.insert("leave.addAlvHistory", addAlvHistory);
		log.info(String.valueOf(count));
		log.info(String.valueOf(userNo));

		if (count>0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int checkOccurMlvToday(String userNo, String todayDate) throws Exception {
		int result = 0;
		Map<String, Object> checkOccurMlvToday = new HashMap<String, Object>();
		checkOccurMlvToday.put("userNo", userNo);
		checkOccurMlvToday.put("todayDate", todayDate);
		int count = session.selectOne("leave.checkOccurMlvToday", checkOccurMlvToday);
		log.info(String.valueOf(count));
		log.info(String.valueOf(userNo));

		if (count>0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int checkAttendAll(String userNo, String todayDate) throws Exception {
		Map<String, Object> checkAttendAll = new HashMap<String, Object>();
		checkAttendAll.put("userNo", userNo);
		checkAttendAll.put("todayDate", todayDate);
		int result = session.selectOne("leave.checkAttendAll", checkAttendAll);
		log.info(String.valueOf(userNo));

		return result;
	}

	@Override
	public int addMlvCount(String userNo) throws Exception {
		int result = 0;
		int count = session.update("leave.addMlvCount", userNo);
		log.info(String.valueOf(count));
		log.info(String.valueOf(userNo));

		if (count>0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int addMlvHistory(String userNo) throws Exception {
		int result = 0;
		int count = session.insert("leave.addMlvHistory", userNo);
		log.info(String.valueOf(count));
		log.info(String.valueOf(userNo));

		if (count>0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public List<LvUsedListDto> getWillUsage(String userNo) throws Exception {
		return session.selectList("leave.getWillUsage", userNo);
	}

	@Override
	public float getAlvUsedCount(String userNo) throws Exception {
		String result = session.selectOne("leave.getAlvUsedCount", userNo);
		if (result == null) {
			result = "0";
		}
		float usedCount = Float.parseFloat(result);
		return usedCount;
	}

	@Override
	public void updateReduceAlv() throws Exception {
		session.update("leave.updateReduceAlv01");
		session.update("leave.updateReduceAlv02");
		session.update("leave.updateReduceAlv03");
	}

	@Override
	public void updateAlvUsedCount(String userNo, float alvUsedCount) {
		Map<String, Object> updateAlvUsedCount = new HashMap<String, Object>();
		updateAlvUsedCount.put("userNo", userNo);
		updateAlvUsedCount.put("alvUsedCount", alvUsedCount);
		session.selectOne("leave.updateAlvUsedCount", updateAlvUsedCount);
	}	
	
}
