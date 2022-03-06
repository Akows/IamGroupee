package com.kh.iag.ea.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.iag.ea.entity.DeptDto;
import com.kh.iag.ea.entity.DocsDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.ProcessDto;
import com.kh.iag.ea.entity.RefDto;
import com.kh.iag.ea.entity.EAUserDto;

public interface EADao {

	FormDto signupFormValue(FormDto dto) throws Exception;

	List<DeptDto> deptValues() throws Exception;

	List<EAUserDto> userValue(String userNo) throws Exception;

	int insertProcessNo(ProcessDto pd) throws Exception;

	ProcessDto selectProcessNo() throws Exception;

	int insertProcess(ProcessDto pd) throws Exception;

	int insertDocument(DocsDto dd) throws Exception;

	int insertRef(RefDto rd) throws Exception;

	DocsDto selectDocument(ProcessDto pd) throws Exception;

	List<ProcessDto> selectProcess(ProcessDto pd) throws Exception;

	List<DocsDto> signupList(HashMap<String, String> map) throws Exception;

	List<FormDto> formList() throws Exception;

	List<ProcessDto> processList(String userNo) throws Exception;

	int getSignupListCnt(String userNo) throws Exception;

	int deleteSignupDoc(String docNo) throws Exception;

	int reSignup(DocsDto dto) throws Exception;

	int reSignupUpdateProcess(String procNo) throws Exception;

	int getApprListCnt(String userNo) throws Exception;

	List<DocsDto> apprList(HashMap<String, String> map) throws Exception;

	List<ProcessDto> processListForApprAll() throws Exception;

	List<ProcessDto> processListForApprOne(String userNo) throws Exception;
	
}
