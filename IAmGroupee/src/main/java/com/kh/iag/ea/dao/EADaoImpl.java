package com.kh.iag.ea.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.ea.entity.CategoryDto;
import com.kh.iag.ea.entity.DeptDto;
import com.kh.iag.ea.entity.DocsDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.ProcessDto;
import com.kh.iag.ea.entity.RefDto;
import com.kh.iag.ea.entity.SignupDto;
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
	public int insertDocumentAlv(DocsDto dd) {
		return sqlSession.insert("ea.insertDocumentAlv", dd);
	}

	@Override
	public int insertDocumentLv(DocsDto dd) {
		return sqlSession.insert("ea.insertDocumentLv", dd);
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
	public DocsDto selectRejectedDocument(ProcessDto pd) {
		return sqlSession.selectOne("ea.selectRejectedDocument", pd);
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
	public List<ProcessDto> processList(String userNo) throws Exception {
		return sqlSession.selectList("ea.processList", userNo);
	}

	@Override
	public int getSignupListCnt(String userNo) throws Exception {
		return sqlSession.selectOne("ea.getSignupListCnt", userNo);
	}

	@Override
	public int deleteSignupDoc(String docNo) throws Exception {
		return sqlSession.update("ea.deleteSignupDoc", docNo);
	}

	@Override
	public int reSignup(DocsDto dto) throws Exception {
		return sqlSession.update("ea.reSignup", dto);
	}

	@Override
	public int reSignupAlv(DocsDto dto) {
		return sqlSession.update("ea.reSignupAlv", dto);
	}

	@Override
	public int reSignupLv(DocsDto dto) {
		return sqlSession.update("ea.reSignupLv", dto);
	}

	@Override
	public int reSignupUpdateProcess(String procNo) throws Exception {
		return sqlSession.update("ea.reSignupUpdateProcess", procNo);
	}

	@Override
	public int getApprListCnt(String userNo) throws Exception {
		return sqlSession.selectOne("ea.getApprListCnt", userNo);
	}

	@Override
	public List<DocsDto> apprList(HashMap<String, String> map) throws Exception {
		return sqlSession.selectList("ea.apprList", map);
	}

	@Override
	public List<ProcessDto> processListForApprAll() throws Exception {
		return sqlSession.selectList("ea.processListForApprAll");
	}

	@Override
	public List<ProcessDto> processListForApprUser(String userNo) throws Exception {
		return sqlSession.selectList("ea.processListForApprUser", userNo);
	}

	@Override
	public int updateProcessState(ProcessDto dto) {
		return sqlSession.update("ea.updateProcessState", dto);
	}

	@Override
	public ProcessDto checkingLastProcess(ProcessDto dto) {
		return sqlSession.selectOne("ea.checkingLastProcess", dto);
	}

	@Override
	public int updateDocumentSep(ProcessDto resultDto) {
		return sqlSession.update("ea.updateDocumentSep", resultDto);
	}

	@Override
	public CategoryDto selectCategoryLeave(SignupDto dto) {
		return sqlSession.selectOne("ea.selectCategoryLeave", dto);
	}

	@Override
	public FormDto selectProcessLeave(SignupDto dto) {
		return sqlSession.selectOne("ea.selectProcessLeave", dto);
	}

	@Override
	public int insertCategoryLeave(SignupDto dto) {
		return sqlSession.insert("ea.insertCategoryLeave", dto);
	}

	@Override
	public int insertFormLeave(SignupDto dto) {
		return sqlSession.insert("ea.insertFormLeave", dto);
	}


}