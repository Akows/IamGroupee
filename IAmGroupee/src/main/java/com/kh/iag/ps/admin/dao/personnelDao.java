package com.kh.iag.ps.admin.dao;

import java.util.List;

import com.kh.iag.ps.admin.entity.PageVo;
import com.kh.iag.ps.admin.entity.UserDto;
import com.kh.iag.ps.admin.entity.departmentDto;
import com.kh.iag.ps.admin.entity.jobDto;
import com.kh.iag.ps.admin.entity.positionDto;

public interface personnelDao {

	int userEnroll(UserDto user) throws Exception;

	int dupCheck(String userNo) throws Exception;

	List<positionDto> posiList() throws Exception;

	List<jobDto> jobList() throws Exception;

	List<departmentDto> deptList() throws Exception;

	int deptCnt() throws Exception;

	int jobCnt() throws Exception;

	int posiCnt() throws Exception;

	int userCnt() throws Exception;

	int getUserCnt(String search) throws Exception;

	List<UserDto> getUserList(PageVo pv) throws Exception;

}
