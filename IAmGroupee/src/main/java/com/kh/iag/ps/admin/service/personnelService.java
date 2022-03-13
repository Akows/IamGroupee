package com.kh.iag.ps.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kh.iag.ps.admin.entity.PageVo;
import com.kh.iag.ps.admin.entity.UserDto;
import com.kh.iag.ps.admin.entity.departmentDto;
import com.kh.iag.ps.admin.entity.jobDto;
import com.kh.iag.ps.admin.entity.positionDto;
import com.kh.iag.ps.admin.entity.psCountDto;

public interface personnelService {

	int userEnroll(UserDto user, HttpServletRequest req) throws Exception;

	int dupCheck(String userNo) throws Exception;

	List<positionDto> posiList() throws Exception;

	List<jobDto> jobList() throws Exception;

	List<departmentDto> deptList() throws Exception;

	psCountDto psCount() throws Exception;

	List<UserDto> getUserList(PageVo pv) throws Exception;

	PageVo getPageVo(String page, String search) throws Exception;

	int userUpdate(UserDto user, HttpServletRequest req) throws Exception;

	int getLastLevel(List<positionDto> posiList) throws Exception;

	int deleteJob(String jobNo) throws Exception;

	int deletePosi(String posiNo) throws Exception;

	int addJob(String jobName) throws Exception;

	int addPosi(positionDto posi) throws Exception;

	int modiPosi(positionDto posi) throws Exception;

	int modiJob(jobDto job) throws Exception;

	List<departmentDto> deptManageList() throws Exception;

	int getMaxLevel(List<departmentDto> deptList) throws Exception;

}
