package com.kh.iag.ea.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.iag.ea.entity.DeptDto;
import com.kh.iag.ea.entity.DocsDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.ProcessDto;
import com.kh.iag.ea.entity.SignupDto;
import com.kh.iag.ea.entity.EAUserDto;

public interface EAService {

	FormDto signupFormValue(FormDto dto) throws Exception;

	List<DeptDto> deptValues() throws Exception;

	List<EAUserDto> userValue(String userNo) throws Exception;

	int insertProcessNo(HttpSession session, SignupDto dto) throws Exception;
	
	ProcessDto selectProcessNo() throws Exception;
	
	int insertProcess(SignupDto dto, ProcessDto pd) throws Exception;

	int insertDocument(SignupDto dto, ProcessDto pd) throws Exception;

	int insertRef(SignupDto dto, ProcessDto pd) throws Exception;

	DocsDto selectDocument(ProcessDto pd) throws Exception;

	List<ProcessDto> selectProcess(ProcessDto pd) throws Exception;


	
}
