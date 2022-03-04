package com.kh.iag.ea.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.ea.entity.DeptDto;
import com.kh.iag.ea.entity.DocsDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.ProcessDto;
import com.kh.iag.ea.entity.RefDto;
import com.kh.iag.ea.entity.EAUserDto;

@Service
public class EADaoImpl implements EADao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public FormDto signupFormValue(FormDto dto) throws Exception {
		return sqlSession.selectOne("ea.signupFormValue", dto);
	}

	@Override
	public List<DeptDto> deptValues() throws Exception {
		return sqlSession.selectList("ea.deptValues");
	}

	@Override
	public List<EAUserDto> userValue(String userNo) throws Exception {
		return sqlSession.selectList("ea.userValues", userNo);
	}
	
	@Override
	public int insertProcessNo(ProcessDto pd) throws Exception {
		return sqlSession.insert("ea.insertProcessNo", pd);
	}

	@Override
	public ProcessDto selectProcessNo() throws Exception {
		return sqlSession.selectOne("ea.selectProcessNo");
	}

	@Override
	public int insertProcess(ProcessDto pd) throws Exception {
		return sqlSession.insert("ea.insertProcess", pd);
	}

	@Override
	public int insertDocument(DocsDto dd) throws Exception {
		return sqlSession.insert("ea.insertDocument", dd);
	}

	@Override
	public int insertRef(RefDto rd) throws Exception {
		return sqlSession.insert("ea.insertRef", rd);
	}

	@Override
	public DocsDto selectDocument(ProcessDto pd) throws Exception {
		return sqlSession.selectOne("ea.selectDocument", pd);
	}

	@Override
	public List<ProcessDto> selectProcess(ProcessDto pd) throws Exception {
		return sqlSession.selectList("ea.selectProcess", pd);
	}

	@Override
	public List<DocsDto> signupList(HashMap<String, String> map) throws Exception {
		return sqlSession.selectList("ea.signupList", map);
	}

	@Override
	public List<FormDto> formList() throws Exception {
		return sqlSession.selectList("ea.formValues");
	}

	@Override
	public List<ProcessDto> processList(String userNo) {
		return sqlSession.selectList("ea.processList", userNo);
	}

	@Override
	public int getSignupListCnt(String userNo) {
		return sqlSession.selectOne("ea.getSignupListCnt", userNo);
	}

}