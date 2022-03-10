package com.kh.iag.ps.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.ps.admin.entity.PageVo;
import com.kh.iag.ps.admin.entity.UserDto;
import com.kh.iag.ps.admin.entity.departmentDto;
import com.kh.iag.ps.admin.entity.jobDto;
import com.kh.iag.ps.admin.entity.positionDto;

@Repository
public class personnelDaoImpl implements personnelDao {

	@Autowired
	SqlSession ss;
	
	@Override
	public int userEnroll(UserDto user) throws Exception {
		return ss.insert("ps.userEnroll",user);
	}

	@Override
	public int dupCheck(String userNo) throws Exception {
		return ss.selectOne("ps.dupCheck",userNo);
	}

	@Override
	public List<positionDto> posiList() throws Exception {
		return ss.selectList("ps.position");
	}

	@Override
	public List<jobDto> jobList() throws Exception {
		return ss.selectList("ps.job");
	}

	@Override
	public List<departmentDto> deptList() throws Exception {
		return ss.selectList("ps.department");
	}

	@Override
	public int deptCnt() throws Exception {
		return ss.selectOne("ps.deptCnt");
	}

	@Override
	public int jobCnt() throws Exception {
		return ss.selectOne("ps.jobCnt");
	}

	@Override
	public int posiCnt() throws Exception {
		return ss.selectOne("ps.posiCnt");
	}

	@Override
	public int userCnt() throws Exception {
		return ss.selectOne("ps.userCnt");
	}

	@Override
	public int getUserCnt(String search) throws Exception {
		return ss.selectOne("ps.getUserCnt", search);
	}

	@Override
	public List<UserDto> getUserList(PageVo pv) throws Exception {
		return ss.selectList("ps.getUserList", pv);
	}

	@Override
	public int userUpdate(UserDto user) throws Exception {
		return ss.update("ps.updateUser", user);
	}

	@Override
	public int deleteJob(String jobNo) throws Exception {
		return ss.delete("ps.deleteJob", jobNo);
	}

	@Override
	public int deletePosi(String posiNo) throws Exception {
		return ss.delete("ps.deletePosi", posiNo);
	}

}
