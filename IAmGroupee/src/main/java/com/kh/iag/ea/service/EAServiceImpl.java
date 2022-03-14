package com.kh.iag.ea.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.ea.admin.dao.AdminEADao;
import com.kh.iag.ea.dao.EADao;
import com.kh.iag.ea.entity.CategoryDto;
import com.kh.iag.ea.entity.DeptDto;
import com.kh.iag.ea.entity.DocsDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.ProcessDto;
import com.kh.iag.ea.entity.RefDto;
import com.kh.iag.ea.entity.SecurityDto;
import com.kh.iag.ea.entity.SettingsDto;
import com.kh.iag.ea.entity.SignupDto;
import com.kh.iag.ps.admin.entity.departmentDto;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

import com.kh.iag.ea.entity.EAUserDto;

@Service
@Slf4j
public class EAServiceImpl implements EAService {
	
	@Autowired
	private EADao dao;
	
	@Autowired
	private AdminEADao adminDao;

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
	public int insertProcessNo(HttpSession session, SignupDto dto) throws Exception {
		
		// 날짜
		LocalDate today = LocalDate.now();
		DateTimeFormatter fm;
		String date = "";
		// 부서
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String dept = "";
		// 양식
		String form = "";
		
		// 문서포맷확인
		SettingsDto sd = adminDao.defaultSettings();
		
		// 날짜확인
		String yearFormat = sd.getFormatYear();
		if("YYMMDD".equals(yearFormat)) {
			fm = DateTimeFormatter.ofPattern("yyMMdd");
			date = today.format(fm).toString();
		} else if("YYMD".equals(yearFormat)) {
			fm =  DateTimeFormatter.ofPattern("yyMd");
			date = today.format(fm).toString();
		} else if("YYYYMMDD".equals(yearFormat)) {
			fm =  DateTimeFormatter.ofPattern("yyyyMMdd");
			date = today.format(fm).toString();
		} else if("YYYYMD".equals(yearFormat)) {
			fm =  DateTimeFormatter.ofPattern("yyyyMd");
			date = today.format(fm).toString();
		}
		// 부서확인
		dept = "부서이름".equals(sd.getFormatDept()) ? 
				loginUser.getDepartmentName().substring(0, loginUser.getDepartmentName().length() - 1) :
				String.valueOf(loginUser.getDepartmentNo());
		// 양식확인
		form = "양식이름".equals(sd.getFormatForm()) ? dto.getFormTitle() : dto.getFormNo();
		
		// 문서 SEQ를 제외한 문서번호 완성
		String format = date + "-" + dept + "-" + form + "-";
		
		ProcessDto pd = new ProcessDto();
		pd.setDocNo(format);
		
		return dao.insertProcessNo(pd);
	}

	@Override
	public ProcessDto selectProcessNo() throws Exception {
		return dao.selectProcessNo();
	}
	
	@Override
	public int insertProcess(SignupDto dto, ProcessDto pd) throws Exception {
		
		int processSum = 0;
		for(int i = 0; i < dto.getApproverNo().length; i++) {
			pd.setUserNo(dto.getApproverNo()[i]);
			pd.setProcSep(i + 1);
			pd.setProcSeq(0);
			pd.setProcCnt(dto.getApproverNo().length);
			
			int result = dao.insertProcess(pd);
			
			processSum += result;
		}
		
		return processSum;
	}

	@Override
	public int insertDocument(SignupDto dto, ProcessDto pd) throws Exception {
		
		DocsDto dd = new DocsDto();
		dd.setDocNo(pd.getDocNo());
		dd.setUserNo(dto.getUserNo());
		dd.setFormNo(dto.getFormNo());
		dd.setProcNo(pd.getProcNo());
		dd.setDocTitle(dto.getTitle());
		dd.setDocContent(dto.getContent());
		dd.setDocSlv(dto.getSecurityLevel());
		dd.setDocClose(dto.getDeadlineDate());
		
		return dao.insertDocument(dd);
	}

	@Override
	public int insertDocumentAlv(SignupDto dto, ProcessDto pd) throws Exception {
		
		DocsDto dd = new DocsDto();
		dd.setDocNo(pd.getDocNo());
		dd.setUserNo(dto.getUserNo());
		dd.setFormNo(dto.getFormNo());
		dd.setProcNo(pd.getProcNo());
		dd.setDocTitle(dto.getTitle());
		dd.setDocSlv(dto.getSecurityLevel());
		dd.setDocClose(dto.getDeadlineDate());
		
		// 연차관련데이터
		dd.setLvCheck(dto.getLvCheck());
		dd.setLvCode(dto.getLvCode());
		
		dd.setAlvStart(dto.getAlvStart());
		dd.setAlvEnd(dto.getAlvStart());
		dd.setAlvReason(dto.getAlvReason());
		
		return dao.insertDocumentAlv(dd);
	}

	@Override
	public int insertDocumentLv(String leavePeriod, SignupDto dto, ProcessDto pd) throws Exception {
		
		DocsDto dd = new DocsDto();
		dd.setDocNo(pd.getDocNo());
		dd.setUserNo(dto.getUserNo());
		dd.setFormNo(dto.getFormNo());
		dd.setProcNo(pd.getProcNo());
		dd.setDocTitle(dto.getTitle());
		dd.setDocSlv(dto.getSecurityLevel());
		dd.setDocClose(dto.getDeadlineDate());
		
		// 휴가관련데이터
		dd.setLvCheck(dto.getLvCheck());
		dd.setLvCode(dto.getLvCode());
		
		String[] leavePeriodSplit = leavePeriod.split(" - ");
		String[] startSplit = leavePeriodSplit[0].split("/");
		String[] endSplit = leavePeriodSplit[1].split("/");
		
		Date start = new Date();
		start.setMonth(Integer.valueOf(startSplit[0]) - 1);
		start.setDate(Integer.valueOf(startSplit[1]));
		start.setYear(Integer.valueOf(startSplit[2]) - 1900);
		
		Date end = new Date();
		end.setMonth(Integer.valueOf(endSplit[0]) - 1);
		end.setDate(Integer.valueOf(endSplit[1]));
		end.setYear(Integer.valueOf(endSplit[2]) - 1900);
		
		dd.setLvStart(start);
		dd.setLvEnd(end);
		dd.setLvReason(dto.getLvReason());
		
		return dao.insertDocumentLv(dd);
	}


	@Override
	public int insertRef(SignupDto dto, ProcessDto pd) throws Exception {
		
		RefDto rd = new RefDto();
		int refSum = 0;
		for(int i = 0; i < dto.getReferNo().length; i++) {
			rd.setRefNo(dto.getReferNo()[i]);
			rd.setDocNo(pd.getDocNo());
			
			int result = dao.insertRef(rd);
			
			refSum += result;
		}
		
		return refSum;			
	}

	@Override
	public DocsDto selectDocument(ProcessDto pd) throws Exception {
		return dao.selectDocument(pd);
	}

	@Override
	public DocsDto selectRejectedDocument(ProcessDto pd) throws Exception {
		return dao.selectRejectedDocument(pd);
	}
	
	@Override
	public List<ProcessDto> selectProcess(ProcessDto pd) throws Exception {
		return dao.selectProcess(pd);
	}

	
	@Override
	public List<DocsDto> signupList(HashMap<String, String> map) throws Exception {
		return dao.signupList(map);
	}

	@Override
	public List<FormDto> formList() throws Exception {
		return dao.formList();
	}

	@Override
	public List<ProcessDto> processList(String userNo) throws Exception {
		return dao.processList(userNo);
	}

	@Override
	public int getSignupListCnt(String userNo) throws Exception {
		return dao.getSignupListCnt(userNo);
	}

	@Override
	public int deleteSignupDoc(String docNo) throws Exception {
		return dao.deleteSignupDoc(docNo);
	}

	@Override
	public int reSignup(DocsDto dto) throws Exception {
		return dao.reSignup(dto);
	}

	@Override
	public int reSignupAlv(DocsDto dto) throws Exception {
		dto.setAlvEnd(dto.getAlvStart());
		
		return dao.reSignupAlv(dto);
	}

	@Override
	public int reSignupLv(DocsDto dto, String leavePeriod) throws Exception {
		
		String[] leavePeriodSplit = leavePeriod.split(" - ");
		String[] startSplit = leavePeriodSplit[0].split("/");
		String[] endSplit = leavePeriodSplit[1].split("/");
		
		Date start = new Date();
		start.setMonth(Integer.valueOf(startSplit[0]) - 1);
		start.setDate(Integer.valueOf(startSplit[1]));
		start.setYear(Integer.valueOf(startSplit[2]) - 1900);
		
		Date end = new Date();
		end.setMonth(Integer.valueOf(endSplit[0]) - 1);
		end.setDate(Integer.valueOf(endSplit[1]));
		end.setYear(Integer.valueOf(endSplit[2]) - 1900);
		
		dto.setLvStart(start);
		dto.setLvEnd(end);
		
		return dao.reSignupLv(dto);
	}

	@Override
	public int reSignupUpdateProcess(String procNo) throws Exception {
		return dao.reSignupUpdateProcess(procNo);
	}

	@Override
	public int getApprListCnt(String userNo) throws Exception {
		return dao.getApprListCnt(userNo);
	}

	@Override
	public List<DocsDto> apprList(HashMap<String, String> map) throws Exception {
		return dao.apprList(map);
	}

	@Override
	public List<ProcessDto> processListForApprAll() throws Exception {
		return dao.processListForApprAll();
	}

	@Override
	public List<ProcessDto> processListForApprUser(String userNo) throws Exception {
		return dao.processListForApprUser(userNo);
	}

	@Override
	public int updateProcessState(ProcessDto dto) throws Exception {
		return dao.updateProcessState(dto);
	}

	@Override
	public ProcessDto checkingLastProcess(ProcessDto dto) throws Exception {
		return dao.checkingLastProcess(dto);
	}

	@Override
	public int updateDocumentSep(ProcessDto resultDto) throws Exception {
		return dao.updateDocumentSep(resultDto);
	}

	@Override
	public CategoryDto selectCategoryLeave(SignupDto dto) throws Exception {
		return dao.selectCategoryLeave(dto);
	}

	@Override
	public FormDto selectProcessLeave(SignupDto dto) throws Exception {
		return dao.selectProcessLeave(dto);
	}

	@Override
	public int insertCategoryLeave(SignupDto dto) throws Exception {
		return dao.insertCategoryLeave(dto);
	}

	@Override
	public int insertFormLeave(SignupDto dto) throws Exception {
		return dao.insertFormLeave(dto);
	}

	@Override
	public int getRefListCnt(String userNo) throws Exception {
		return dao.getRefListCnt(userNo);
	}

	@Override
	public List<DocsDto> refList(HashMap<String, String> map) throws Exception {
		return dao.refList(map);
	}

	@Override
	public List<ProcessDto> processListRef(String userNo) throws Exception {
		return dao.processListRef(userNo);
	}

	@Override
	public List<DocsDto> selectRelatedDocs(String userNo) throws Exception {
		return dao.selectRelatedDocs(userNo);
	}

	@Override
	public int selectSecA() throws Exception {
		return dao.selectSecA();
	}

	@Override
	public int selectSecB() throws Exception {
		return dao.selectSecB();
	}

	@Override
	public List<DocsDto> selectNotRelatedDocs(String userNo) throws Exception {
		return dao.selectNotRelatedDocs(userNo);
	}

	@Override
	public List<departmentDto> departmentList() throws Exception {
		return dao.departmentList();
	}

	@Override
	public DocsDto selectDocumentEntire(ProcessDto pd) throws Exception {
		return dao.selectDocumentEntire(pd);
	}

	@Override
	public List<DocsDto> signupListForFilter(String userNo) {
		return dao.signupListForFilter(userNo);
	}

	@Override
	public List<DocsDto> apprListForFilter(String userNo) {
		return dao.apprListForFilter(userNo);
	}

	@Override
	public List<DocsDto> refListForFilter(String userNo) {
		return dao.refListForFilter(userNo);
	}

	@Override
	public int updateDocumentStageWhenOne(ProcessDto resultDto) {
		return dao.updateDocumentStageWhenOne(resultDto);
	}

	@Override
	public int updateDocumentStageWhenFour(ProcessDto resultDto) {
		return dao.updateDocumentStageWhenFour(resultDto);
	}

	@Override
	public SecurityDto selectSecADetail() {
		return dao.selectSecADetail();
	}

	@Override
	public SecurityDto selectSecBDetail() {
		return dao.selectSecBDetail();
	}

	@Override
	public int updateStageName(ProcessDto dto) {
		return dao.updateStageName(dto);
	}

}
