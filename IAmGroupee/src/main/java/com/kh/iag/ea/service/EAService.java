package com.kh.iag.ea.service;

import java.util.List;

import com.kh.iag.ea.entity.DeptDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.EAUserDto;

public interface EAService {

	FormDto signupFormValue(FormDto dto) throws Exception;

	List<DeptDto> deptValues() throws Exception;

	List<EAUserDto> userValue(String userNo) throws Exception;
	
}
