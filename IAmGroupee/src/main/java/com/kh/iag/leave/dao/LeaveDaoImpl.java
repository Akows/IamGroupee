package com.kh.iag.leave.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.leave.entity.LeaveDto;
import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.leave.entity.LvUsedListDto;

@Repository
public class LeaveDaoImpl implements LeaveDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<LvUsedListDto> getAlvList(String userNo) throws Exception {
		return session.selectList("leave.getAlvList", userNo);
	}

	@Override
	public List<LvUsedListDto> getLvList(String userNo) throws Exception {
		return session.selectList("leave.getLvList", userNo);
	}

	@Override
	public int getAlvRowCnt(String userNo) throws Exception {
		return session.selectOne("leave.getAlvRowCnt", userNo);
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

	
	
}
