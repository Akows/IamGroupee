package com.kh.iag.ea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.ea.dao.EADao;
import com.kh.iag.ea.entity.DeptDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.ProcessDto;
import com.kh.iag.ea.entity.SignupDto;
import com.kh.iag.ea.entity.EAUserDto;

@Service
public class EAServiceImpl implements EAService {
	
	@Autowired
	private EADao dao;

	@Override
	public FormDto signupFormValue(FormDto dto) throws Exception {
		return dao.signupFormValue(dto);
	}

	@Override
	public List<DeptDto> deptValues() throws Exception {
		return dao.deptValues();
	}

	@Override
	public List<EAUserDto> userValue(String userNo) throws Exception {
		return dao.userValue(userNo);
	}

	@Override
	public int insertProcess(SignupDto dto) throws Exception {
		
		ProcessDto pd = new ProcessDto();;
		int processSum = 0;
		for(int i = 0; i < dto.getApproverNo().length; i++) {
			if(i == 0)
				pd.setProcNo("SEQ_EA_PROCESS_NO.NEXTVAL");
			else
				pd.setProcNo("SEQ_EA_PROCESS_NO.CURRVAL");
			pd.setUserNo(dto.getApproverNo()[i]);
			pd.setProcSep(i + 1);
			pd.setProcSeq(0);
			
			int result = dao.insertProcess(pd);
			
			processSum += result;
		}
		
		return processSum;
	}
}
