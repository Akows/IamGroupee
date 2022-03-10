
package com.kh.iag.ea.controller;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iag.ea.admin.service.AdminEAService;
import com.kh.iag.ea.entity.CategoryDto;
import com.kh.iag.ea.entity.DeptDto;
import com.kh.iag.ea.entity.DocsDto;
import com.kh.iag.ea.entity.EAUserDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.PageDto;
import com.kh.iag.ea.entity.ProcessDto;
import com.kh.iag.ea.entity.SignupDto;
import com.kh.iag.ea.service.EAService;
import com.kh.iag.ps.admin.entity.departmentDto;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/ea")
public class EAController {
	@Autowired
	private EAService service;
	
	@Autowired
	private AdminEAService AdminService;
	
//---------------------------------------------------------------- 기안신청
	// 기안신청 (양식선택)
	@GetMapping(value = "/signup")
	public String signUp(Model model) throws Exception {
		
		// 양식 카테고리 데이터
		List<CategoryDto> categoryValues = AdminService.categoryValues();
		model.addAttribute("categoryValues", categoryValues);
		// 양식 데이터
		List<FormDto> formValues = AdminService.formValues();
		model.addAttribute("formValues", formValues);
		
		return "ea/user/ea_signup_form";
	}
	// 기안신청 (기안작성)
	@GetMapping(value = "/write")
	public String write(Model model, HttpSession session, @ModelAttribute FormDto dto) throws Exception {
		// 기안 신청시 작성하는 양식 데이터
		FormDto formValue = service.signupFormValue(dto);
		model.addAttribute("formValue", formValue);
		
		// 부서 목록 (부서 번호, 부서명)
		List<DeptDto> deptValues = service.deptValues();
		model.addAttribute("deptValues", deptValues);
		
		// 사원 목록 (사원 번호, 이름, 부서(번호,이름), 직급(번호,이름) 데이터 가져오기 - ACTIVITY_YN = 'Y'인 사원만)
		// 로그인한 사용자를 제외한다.
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		List<EAUserDto> userValues = service.userValue(userNo);
		model.addAttribute("userValues", userValues);
		
		return "ea/user/ea_signup_write";
	}
	// 기안신청 (연차기안)
	@GetMapping(value = "/write_lvA")
	public String writeA(Model model, HttpSession session) throws Exception {
		
		// 부서 목록 (부서 번호, 부서명)
		List<DeptDto> deptValues = service.deptValues();
		model.addAttribute("deptValues", deptValues);
		
		// 사원 목록 (사원 번호, 이름, 부서(번호,이름), 직급(번호,이름) 데이터 가져오기 - ACTIVITY_YN = 'Y'인 사원만)
		// 로그인한 사용자를 제외한다.
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		List<EAUserDto> userValues = service.userValue(userNo);
		model.addAttribute("userValues", userValues);
		
		return "ea/user/ea_signup_write_lvA";
	}
	
	// 기안신청 (휴가기안)
	@GetMapping(value = "/write_lvB")
	public String writeB(Model model, HttpSession session) throws Exception {
		
		// 부서 목록 (부서 번호, 부서명)
		List<DeptDto> deptValues = service.deptValues();
		model.addAttribute("deptValues", deptValues);

		// 사원 목록 (사원 번호, 이름, 부서(번호,이름), 직급(번호,이름) 데이터 가져오기 - ACTIVITY_YN = 'Y'인 사원만)
		// 로그인한 사용자를 제외한다.
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		List<EAUserDto> userValues = service.userValue(userNo);
		model.addAttribute("userValues", userValues);
		
		return "ea/user/ea_signup_write_lvB";
	}
	
	// 기안신청 (처리)
	@PostMapping(value = "/write")
	public String write(Model model, HttpSession session, @ModelAttribute SignupDto dto, String leavePeriod) throws Exception {
		
		log.info(dto.toString());
		
		// 결재선 번호 테이블 인서트(문서번호, 결재선번호)
		int result1 = service.insertProcessNo(session, dto);
		// 결재선 번호 테이블 셀렉트(위에서 인서트한 데이터)
		ProcessDto pd = service.selectProcessNo();
		// 결재선 테이블 인서트 (결재자 수만큼)
		int result2 = service.insertProcess(dto, pd);
		
		
		CategoryDto categoryLeave = null;
		FormDto formLeave = null;
		if("A".equals(dto.getLvCheck())) {
			
			categoryLeave = service.selectCategoryLeave(dto);
			if(categoryLeave == null) {
				int insertCategoryLeave = service.insertCategoryLeave(dto);
				System.out.println("insertCategoryLeave:::" + insertCategoryLeave);
			}
			
			formLeave = service.selectProcessLeave(dto);
			if(formLeave == null) {
				int insertFormLeave = service.insertFormLeave(dto);
				System.out.println("insertFormLeave:::" + insertFormLeave);
			}
			
			// 연차 문서 인서트
			int result3 = service.insertDocumentAlv(dto, pd);
			
		} else if("B".equals(dto.getLvCheck())) {
			
			categoryLeave = service.selectCategoryLeave(dto);
			if(categoryLeave == null) {
				int insertCategoryLeave = service.insertCategoryLeave(dto);
				System.out.println("insertCategoryLeave:::" + insertCategoryLeave);
			}
			
			formLeave = service.selectProcessLeave(dto);
			if(formLeave == null) {
				int insertFormLeave = service.insertFormLeave(dto);
				System.out.println("insertFormLeave:::" + insertFormLeave);
			}
			
			// 휴가 문서 인서트
			int result3 = service.insertDocumentLv(leavePeriod, dto, pd);
			
		} else {
			// 문서 테이블 인서트
			int result3 = service.insertDocument(dto, pd);
		}
		
		// 참조자 테이블 인서트 
		if(dto.getReferNo().length > 0) {			
			int result4 = service.insertRef(dto, pd);
		}
		// addAttribute
		// 문서 정보 문서 테이블
		DocsDto doc = service.selectDocument(pd);
		Date makeDate = doc.getDocMake();
		Date closeDate = doc.getDocClose();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy. MM. dd.");
		doc.setSimpleMakeDate(ft.format(makeDate));
		doc.setSimpleCloseDate(ft.format(closeDate));
		
		if("A".equals(dto.getLvCheck())) {
			Date appliDate = doc.getAlvAppli();
			Date startDate = doc.getAlvStart();
			Date endDate = doc.getAlvEnd();
			
			doc.setSimpleAppliDate(ft.format(appliDate));
			doc.setSimpleStartDate(ft.format(startDate));
			doc.setSimpleEndDate(ft.format(endDate));
			
		} else if("B".equals(dto.getLvCheck())) {
			Date appliDate = doc.getLvAppli();
			Date startDate = doc.getLvStart();
			Date endDate = doc.getLvEnd();
			
			doc.setSimpleAppliDate(ft.format(appliDate));
			doc.setSimpleStartDate(ft.format(startDate));
			doc.setSimpleEndDate(ft.format(endDate));
		}
		
		model.addAttribute("docInfo", doc);
		
		// 결재자 정보 결재선 테이블
		List<ProcessDto> processList = service.selectProcess(pd);
		model.addAttribute("processList", processList);
		
		log.info(doc.toString());
		// 완료후 기안문서조회 상세 페이지로
		return "ea/user/ea_signuplist_detail";
	}
//---------------------------------------------------------------- 기안문서조회
	// 기안문서조회 (리스트)
	@GetMapping(value = {"/signuplist/{page}", "/signuplist"})
	public String signuplist(HttpSession session, Model model, @PathVariable(required = false) String page) throws Exception {
		
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		if(page == null) {
			return "redirect:signuplist/1";
		}
		int cntPerPage = 15;
		int pageBtnCnt = 5;
		int totalRow = service.getSignupListCnt(userNo);
		PageDto vo = new PageDto(page, cntPerPage, pageBtnCnt, totalRow);
		
		HashMap<String, String> map =  new HashMap<>();
		map.put("userNo", userNo);
		map.put("startRow", String.valueOf(vo.getStartRow()));
		map.put("endRow", String.valueOf(vo.getEndRow()));
		
		
		// 자신이 기안한 문서들 데이터
		List<DocsDto> signupList = service.signupList(map);
		
		for(DocsDto d : signupList) {
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			Date makeDate = d.getDocMake();
			Date closeDate = d.getDocClose();
			d.setSimpleMakeDate(ft.format(makeDate));
			d.setSimpleCloseDate(ft.format(closeDate));
		}
		model.addAttribute("signupList", signupList);
		model.addAttribute("page", vo);
		
		// 양식전체종류 데이터 (테이블헤더에 필요)
		List<FormDto> formList = service.formList();
		model.addAttribute("formList", formList);
		
		// 진행단계 데이터 (테이블헤더에 필요)
		List<ProcessDto> processList = service.processList(userNo);
		model.addAttribute("processList", processList);
		
		return "ea/user/ea_signuplist_list";
	}
	
	// 필터링
	@RequestMapping(value = "/signuplistByFilter")
	public String signuplistByFilter(HttpSession session, Model model, String formNo, String make, String close, String procSeq) throws Exception {
		
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		// 양식전체종류 데이터 (테이블헤더에 필요)
		List<FormDto> formList = service.formList();
		model.addAttribute("formList", formList);
		
		// 진행단계 데이터 (테이블헤더에 필요)
		List<ProcessDto> processList = service.processList(userNo);
		model.addAttribute("processList", processList);
		
		// 자신이 기안한 문서들 데이터
		List<DocsDto> signupList = service.signupListForFilter(userNo);
		
		System.out.println(signupList.get(0).toString());
		
		List<DocsDto> list = new ArrayList<>();
		
		// 양식
		if(formNo != null) {
			for(int i = 0; i < signupList.size(); i++) {
				if(signupList.get(i).getFormNo().equals(formNo)) {
					list.add(signupList.get(i));
				}
			}
		// 상신날짜
		} else if(make != null) {
			for(int i = 0; i < signupList.size(); i++) {
				list.add(signupList.get(i));
			}
			
			if("old".equals(make))
				Collections.sort(list, (d1, d2) -> d1.getDocMake().compareTo(d2.getDocMake()));
			else
				Collections.sort(list, (d1, d2) -> d2.getDocMake().compareTo(d1.getDocMake()));
		// 마감날짜
		} else if(close != null) {
			for(int i = 0; i < signupList.size(); i++) {
				list.add(signupList.get(i));
			}
			
			if("old".equals(close))
				Collections.sort(list, (d1, d2) -> d1.getDocClose().compareTo(d2.getDocClose()));
			else
				Collections.sort(list, (d1, d2) -> d2.getDocClose().compareTo(d1.getDocClose()));
		// 진행단계
		} else if(procSeq != null) {
//			for(int i = 0; i < processList.size(); i++) {
//				if(procSeq == "2") {
//					for(int j = 0; j < signupList.size(); j++) {
//						if(processList.get(i).getDocNo().equals(signupList.get(j).getDocNo()) && processList.get(i).getProcSeq() == 2) {
//							list.add(signupList.get(j));
//						}
//					}					
//				} else if(procSeq == "3") {
//					for(int j = 0; j < signupList.size(); j++) {
//						if(processList.get(i).getDocNo().equals(signupList.get(j).getDocNo()) && processList.get(i).getProcSeq() == 3) {
//							list.add(signupList.get(j));
//						}
//					}	
//				} else {
//					for(int j = 0; j < signupList.size(); j++) {
//						if(processList.get(i).getDocNo().equals(signupList.get(j).getDocNo())) {
//							if(processList.get(i).getProcSep() == processList.get(i).getProcCnt()) {
//								if(processList.get(i).getPro)
//							}
//						}
//					}	
//				}
//			}
		}
		
		for(DocsDto d : list) {
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			Date makeDate = d.getDocMake();
			Date closeDate = d.getDocClose();
			d.setSimpleMakeDate(ft.format(makeDate));
			d.setSimpleCloseDate(ft.format(closeDate));
		}
		model.addAttribute("signupList", list);
		
		
		
		
		return "ea/user/ea_signuplist_list";
	}
	
	// 기안문서조회 (상세조회)
	@PostMapping(value = "/signuplist/detail")
	public String signuplistDetail(Model model, String process, String docNo) throws Exception {
		
		// 반려 문서시 내용 수정하여 다시 기안할 수 있는 페이지로 이동
		if(("반려".equals(process)) || "협의요청".equals(process)) {
			ProcessDto pd = new ProcessDto();
			pd.setDocNo(docNo);
			
			// 문서 정보 문서 테이블
			DocsDto doc = service.selectRejectedDocument(pd);
			Date makeDate = doc.getDocMake();
			Date closeDate = doc.getDocClose();
			SimpleDateFormat ft = new SimpleDateFormat("yyyy. MM. dd.");
			doc.setSimpleMakeDate(ft.format(makeDate));
			doc.setSimpleCloseDate(ft.format(closeDate));
			
			if("A".equals(doc.getLvCheck())) {
				Date appliDate = doc.getAlvAppli();
				Date startDate = doc.getAlvStart();
				Date endDate = doc.getAlvEnd();
				
				doc.setSimpleAppliDate(ft.format(appliDate));
				doc.setSimpleStartDate(ft.format(startDate));
				doc.setSimpleEndDate(ft.format(endDate));
				
			} else if("B".equals(doc.getLvCheck())) {
				Date appliDate = doc.getLvAppli();
				Date startDate = doc.getLvStart();
				Date endDate = doc.getLvEnd();
				
				doc.setSimpleAppliDate(ft.format(appliDate));
				doc.setSimpleStartDate(ft.format(startDate));
				doc.setSimpleEndDate(ft.format(endDate));
			}
			
			
			model.addAttribute("docInfo", doc);
			
			
			pd.setProcNo(doc.getProcNo());
			
			// 결재자 정보 결재선 테이블
			List<ProcessDto> processList = service.selectProcess(pd);
			model.addAttribute("processList", processList);
			
			
			return "ea/user/ea_signuplist_rejected";			
		} else {
			ProcessDto pd = new ProcessDto();
			pd.setDocNo(docNo);
			
			// 문서 정보 문서 테이블
			DocsDto doc = service.selectDocument(pd);
			Date makeDate = doc.getDocMake();
			Date closeDate = doc.getDocClose();
			SimpleDateFormat ft = new SimpleDateFormat("yyyy. MM. dd.");
			doc.setSimpleMakeDate(ft.format(makeDate));
			doc.setSimpleCloseDate(ft.format(closeDate));
			
			if("A".equals(doc.getLvCheck())) {
				Date appliDate = doc.getAlvAppli();
				Date startDate = doc.getAlvStart();
				Date endDate = doc.getAlvEnd();
				
				doc.setSimpleAppliDate(ft.format(appliDate));
				doc.setSimpleStartDate(ft.format(startDate));
				doc.setSimpleEndDate(ft.format(endDate));
				
			} else if("B".equals(doc.getLvCheck())) {
				Date appliDate = doc.getLvAppli();
				Date startDate = doc.getLvStart();
				Date endDate = doc.getLvEnd();
				
				doc.setSimpleAppliDate(ft.format(appliDate));
				doc.setSimpleStartDate(ft.format(startDate));
				doc.setSimpleEndDate(ft.format(endDate));
			}
			
			model.addAttribute("docInfo", doc);
			
			pd.setProcNo(doc.getProcNo());
			
			// 결재자 정보 결재선 테이블
			List<ProcessDto> processList = service.selectProcess(pd);
			model.addAttribute("processList", processList);
			
			return "ea/user/ea_signuplist_detail";
		}
	}
	
	// 반려/협의요청 문서 삭제하기
	@RequestMapping(value = "deleteSignupDoc", method = RequestMethod.GET)
	@ResponseBody
	public int deleteSignupDoc(String docNo) throws Exception {
		return service.deleteSignupDoc(docNo);		
	}
	
	// 반려/협의요청 문서 재기안하기
	@RequestMapping(value = "reSignup", method = RequestMethod.POST)
	public String reSignup(@ModelAttribute DocsDto dto, String leavePeriod) throws Exception {
		
		if("A".equals(dto.getLvCheck())) {
			int result1 = service.reSignupAlv(dto);
		} else if("B".equals(dto.getLvCheck())) {
			int result2 = service.reSignupLv(dto, leavePeriod);
		} else {
			// docTitle, docClose, docContent, docMake(SYSDATE) EA_DOCUMENT 테이블 수정사항 업데이트
			int result3 = service.reSignup(dto);			
		}
		
		
		// procNo으로 EA_PROCESS 테이블에서 반려자나 협의요청자의 PROC_SEQ = 0 으로 바꿔주기
		String procNo = dto.getProcNo();
		int result4 = service.reSignupUpdateProcess(procNo);
		
		return "ea/user/ea_signuplist_list";
	}
//---------------------------------------------------------------- 결재문서조회
	// 결재문서조회 (리스트)
	@GetMapping(value = {"/apprlist/{page}", "/apprlist"})
	public String apprlist(HttpSession session, Model model, @PathVariable(required = false) String page) throws Exception {
		
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		if(page == null) {
			return "redirect:apprlist/1";
		}
		int cntPerPage = 15;
		int pageBtnCnt = 5;
		int totalRow = service.getApprListCnt(userNo);
		PageDto vo = new PageDto(page, cntPerPage, pageBtnCnt, totalRow);
		
		HashMap<String, String> map =  new HashMap<>();
		map.put("userNo", userNo);
		map.put("startRow", String.valueOf(vo.getStartRow()));
		map.put("endRow", String.valueOf(vo.getEndRow()));
		
		// 자신이 결재할 문서들
		List<DocsDto> apprList = service.apprList(map);
		
		for(DocsDto d : apprList) {
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			Date makeDate = d.getDocMake();
			Date closeDate = d.getDocClose();
			d.setSimpleMakeDate(ft.format(makeDate));
			d.setSimpleCloseDate(ft.format(closeDate));
		}
		model.addAttribute("apprList", apprList);
		model.addAttribute("page", vo);
		
		// 양식전체종류 데이터 (테이블헤더에 필요)
		List<FormDto> formList = service.formList();
		model.addAttribute("formList", formList);
		
		// 진행단계 데이터 (테이블헤더에 필요, 결재순서가 로그인한 유저 순서인 문서를 찾기 위한 모든 결재선 정보)
		List<ProcessDto> processListForApprAll = service.processListForApprAll();
		model.addAttribute("processListForApprAll", processListForApprAll);
		
		// 진행단계 데이터 (테이블헤더에 필요, 결재순서가 로그인한 유저 순서인 문서를 찾기 위한 로그인한 유저의 결재선 정보)
		List<ProcessDto> processListForApprUser = service.processListForApprUser(userNo);
		model.addAttribute("processListForApprUser", processListForApprUser);
		
		return "ea/user/ea_apprlist_list";
	}
	
	// 결재문서조회 (상세조회)
	@PostMapping(value = "/apprlist/detail")
	public String apprlistDetail(Model model, HttpSession session, String docNo) throws Exception {
		
		ProcessDto pd = new ProcessDto();
		pd.setDocNo(docNo);
		
		// 문서 정보 문서 테이블
		DocsDto doc = service.selectDocument(pd);
		Date makeDate = doc.getDocMake();
		Date closeDate = doc.getDocClose();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy. MM. dd.");
		doc.setSimpleMakeDate(ft.format(makeDate));
		doc.setSimpleCloseDate(ft.format(closeDate));
		
		if("A".equals(doc.getLvCheck())) {
			Date appliDate = doc.getAlvAppli();
			Date startDate = doc.getAlvStart();
			Date endDate = doc.getAlvEnd();
			
			doc.setSimpleAppliDate(ft.format(appliDate));
			doc.setSimpleStartDate(ft.format(startDate));
			doc.setSimpleEndDate(ft.format(endDate));
			
		} else if("B".equals(doc.getLvCheck())) {
			Date appliDate = doc.getLvAppli();
			Date startDate = doc.getLvStart();
			Date endDate = doc.getLvEnd();
			
			doc.setSimpleAppliDate(ft.format(appliDate));
			doc.setSimpleStartDate(ft.format(startDate));
			doc.setSimpleEndDate(ft.format(endDate));
		}
		
		model.addAttribute("docInfo", doc);
		
		pd.setProcNo(doc.getProcNo());
		
		// 결재자 정보 결재선 테이블
		List<ProcessDto> processList = service.selectProcess(pd);
		model.addAttribute("processList", processList);
		
		// 로그인 유저 정보
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		model.addAttribute("loginUserNo", userNo);
		
		return "ea/user/ea_apprlist_detail";
		

	}
	// 결재문서조회 (결재진행)
	@PostMapping(value = "/apprlist/process")
	public String apprlisApprved(String docNo, @ModelAttribute ProcessDto dto) throws Exception {
		
		// 결재선 테이블 업데이트
		int result = service.updateProcessState(dto);
		log.info("결재선테이블업데이트::::" + result);
		
		// 결재업데이트한 행 가지고 와서 거기에 있는 procSep이랑 procCnt가 같고, procSeq이 1이거나 4이면 승인완료된 문서로 바꿔야함 DOC_SEP = 'Y'로
		ProcessDto resultDto = service.checkingLastProcess(dto);
		if((resultDto.getProcSep() == resultDto.getProcCnt()) || (resultDto.getProcSeq() == 4)) {
			if(resultDto.getProcSeq() == 1 || resultDto.getProcSeq() == 4) {
				// EA_DOCUMENT 테이블 문서 승인완료로 돌리기
				int result1 = service.updateDocumentSep(resultDto);
				log.info("문서테이블업데이트::::" + result1);
			}
		}
		
		return "ea/user/ea_apprlist_list";
	}
//---------------------------------------------------------------- 참조문서조회
	//참조문서조회 (리스트)
	@GetMapping(value = {"/reflist/{page}", "/reflist"})
	public String reflist(HttpSession session, Model model, @PathVariable(required = false) String page) throws Exception {
		
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		if(page == null) {
			return "redirect:reflist/1";
		}
		int cntPerPage = 15;
		int pageBtnCnt = 5;
		int totalRow = service.getRefListCnt(userNo);
		PageDto vo = new PageDto(page, cntPerPage, pageBtnCnt, totalRow);
		
		HashMap<String, String> map =  new HashMap<>();
		map.put("userNo", userNo);
		map.put("startRow", String.valueOf(vo.getStartRow()));
		map.put("endRow", String.valueOf(vo.getEndRow()));
		
		
		// 자신이 참조하는 문서들 데이터
		List<DocsDto> refList = service.refList(map);
		
		for(DocsDto d : refList) {
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			Date makeDate = d.getDocMake();
			Date closeDate = d.getDocClose();
			d.setSimpleMakeDate(ft.format(makeDate));
			d.setSimpleCloseDate(ft.format(closeDate));
		}
		model.addAttribute("refList", refList);
		model.addAttribute("page", vo);
		
		// 양식전체종류 데이터 (테이블헤더에 필요)
		List<FormDto> formList = service.formList();
		model.addAttribute("formList", formList);
		
		// 진행단계 데이터 (테이블헤더에 필요)
		List<ProcessDto> processList = service.processListRef(userNo);
		model.addAttribute("processList", processList);
		
		return "ea/user/ea_reflist_list";
	}
	// 참조문서조회 (상세조회)
	@PostMapping(value = "/reflist/detail")
	public String reflistDetail(Model model, String process, String docNo) throws Exception {
		
		ProcessDto pd = new ProcessDto();
		pd.setDocNo(docNo);
		
		// 문서 정보 문서 테이블
		DocsDto doc = service.selectDocument(pd);
		Date makeDate = doc.getDocMake();
		Date closeDate = doc.getDocClose();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy. MM. dd.");
		doc.setSimpleMakeDate(ft.format(makeDate));
		doc.setSimpleCloseDate(ft.format(closeDate));
		
		if("A".equals(doc.getLvCheck())) {
			Date appliDate = doc.getAlvAppli();
			Date startDate = doc.getAlvStart();
			Date endDate = doc.getAlvEnd();
			
			doc.setSimpleAppliDate(ft.format(appliDate));
			doc.setSimpleStartDate(ft.format(startDate));
			doc.setSimpleEndDate(ft.format(endDate));
			
		} else if("B".equals(doc.getLvCheck())) {
			Date appliDate = doc.getLvAppli();
			Date startDate = doc.getLvStart();
			Date endDate = doc.getLvEnd();
			
			doc.setSimpleAppliDate(ft.format(appliDate));
			doc.setSimpleStartDate(ft.format(startDate));
			doc.setSimpleEndDate(ft.format(endDate));
		}
		
		model.addAttribute("docInfo", doc);
		
		pd.setProcNo(doc.getProcNo());
		
		// 결재자 정보 결재선 테이블
		List<ProcessDto> processList = service.selectProcess(pd);
		model.addAttribute("processList", processList);
		
		return "ea/user/ea_reflist_detail";
	}
	
//---------------------------------------------------------------- 전체문서조회
	// 캡슐
	public List<DocsDto> entireCap(HttpSession session) throws Exception {
		
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		long positionNo = loginUser.getPositionNo();
		
		// SEC_A, SEC_B 설정정보
		int secA = service.selectSecA();
		int secB = service.selectSecB();
		
		
		// 로그인한 유저의 기안문서, 결재문서, 참고문서 데이터 (S등급)
		List<DocsDto> relatedDocs = service.selectRelatedDocs(userNo);
		
		// 로그인한 유저와 관련없는(기안, 결재, 참고하지 않은) 문서들 (보안등급 필터링 필요)
		List<DocsDto> notRelatedDocs = service.selectNotRelatedDocs(userNo);
		
		// 화면으로 보낼 문서 리스트
		List<DocsDto> entireList = new ArrayList<>();
		
		// S등급
		relatedDocs.stream()
				   .forEach(d -> entireList.add(d));
		
		// C등급 문서 처리
		notRelatedDocs.stream()
					  .filter(d -> d.getDocSlv().equals("C"))
					  .forEach(d -> entireList.add(d));
		
		// B등급 문서 처리
		notRelatedDocs.stream()
					  .filter(d -> d.getDocSlv().equals("B") && positionNo <= secB)
					  .forEach(d -> entireList.add(d));
		
		// A등급 문서 처리
		notRelatedDocs.stream()
					  .filter(d -> d.getDocSlv().equals("A") && positionNo <= secA)
					  .forEach(d -> entireList.add(d));
		
		
		return entireList;
	}
	// 전체문서조회 (리스트) (결재승인이 완료된 문서중 --> (자신이 기안자, 결재자, 참고자인 문서 or 보안등급 상 열람 가능한 문서))
	@GetMapping(value = {"/entirelist/{page}", "/entirelist"})
	public String entirelist(HttpSession session, Model model, @PathVariable(required = false) String page) throws Exception {
		
		List<DocsDto> entireList = entireCap(session);
		
		if(page == null) {
			return "redirect:entirelist/1";
		}
		int cntPerPage = 15;
		int pageBtnCnt = 5;
		int totalRow = entireList.size();
		PageDto vo = new PageDto(page, cntPerPage, pageBtnCnt, totalRow);
		
		
		List<DocsDto> list = new ArrayList<>();
		
		for(int i = vo.getStartRow() - 1; i < vo.getEndRow(); i++) {
			if(i == totalRow) {
				break;
			}
			list.add(entireList.get(i));
		}
		
		for(DocsDto d : list) {
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			Date makeDate = d.getDocMake();
			Date closeDate = d.getDocClose();
			d.setSimpleMakeDate(ft.format(makeDate));
			d.setSimpleCloseDate(ft.format(closeDate));
		}
		model.addAttribute("entireList", list);
		model.addAttribute("page", vo);
		
		// 양식전체종류 데이터 (테이블헤더에 필요)
		List<FormDto> formList = service.formList();
		model.addAttribute("formList", formList);
		
		// 부서 데이터 (테이블헤더에 필요)
		List<departmentDto> departmentList = service.departmentList();
		model.addAttribute("departmentList" ,departmentList);
		
		return "ea/user/ea_entirelist_list";
	}
	// 필터링
	@RequestMapping(value = "/entirelistByFilter")
	public String entirelistByFilter(HttpSession session, Model model, String formNo, String make, String close, String departmentName) throws Exception {
		
		List<DocsDto> entireList = entireCap(session);
		
		List<DocsDto> list = new ArrayList<>();
		
		// 양식
		if(formNo != null) {
			for(int i = 0; i < entireList.size(); i++) {
				if(entireList.get(i).getFormNo().equals(formNo)) {
					list.add(entireList.get(i));
				}
			}
		// 상신날짜
		} else if(make != null) {
			for(int i = 0; i < entireList.size(); i++) {
				list.add(entireList.get(i));
			}
			
			if("old".equals(make))
				Collections.sort(list, (d1, d2) -> d1.getDocMake().compareTo(d2.getDocMake()));
			else
				Collections.sort(list, (d1, d2) -> d2.getDocMake().compareTo(d1.getDocMake()));
		// 마감날짜
		} else if(close != null) {
			for(int i = 0; i < entireList.size(); i++) {
				list.add(entireList.get(i));
			}
			
			if("old".equals(close))
				Collections.sort(list, (d1, d2) -> d1.getDocClose().compareTo(d2.getDocClose()));
			else
				Collections.sort(list, (d1, d2) -> d2.getDocClose().compareTo(d1.getDocClose()));
		// 부서
		} else if(departmentName != null) {
			for(int i = 0; i < entireList.size(); i++) {
				if(entireList.get(i).getDepartmentName().equals(departmentName)) {
					list.add(entireList.get(i));
				}
			}
		}
		
		for(DocsDto d : list) {
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			Date makeDate = d.getDocMake();
			Date closeDate = d.getDocClose();
			d.setSimpleMakeDate(ft.format(makeDate));
			d.setSimpleCloseDate(ft.format(closeDate));
		}
		model.addAttribute("entireList", list);
		
		// 양식전체종류 데이터 (테이블헤더에 필요)
		List<FormDto> formList = service.formList();
		model.addAttribute("formList", formList);
		
		// 부서 데이터 (테이블헤더에 필요)
		List<departmentDto> departmentList = service.departmentList();
		model.addAttribute("departmentList" ,departmentList);
		
		return "ea/user/ea_entirelist_list";
	}
	
	// 전체문서조회 (상세조회)
	@PostMapping(value = "/entirelist/detail")
	public String entirelistDetail(Model model, String docNo) throws Exception {
		
		ProcessDto pd = new ProcessDto();
		pd.setDocNo(docNo);
		
		// 문서 정보 문서 테이블
		DocsDto doc = service.selectDocumentEntire(pd);
		Date makeDate = doc.getDocMake();
		Date closeDate = doc.getDocClose();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy. MM. dd.");
		doc.setSimpleMakeDate(ft.format(makeDate));
		doc.setSimpleCloseDate(ft.format(closeDate));
		
		if("A".equals(doc.getLvCheck())) {
			Date appliDate = doc.getAlvAppli();
			Date startDate = doc.getAlvStart();
			Date endDate = doc.getAlvEnd();
			
			doc.setSimpleAppliDate(ft.format(appliDate));
			doc.setSimpleStartDate(ft.format(startDate));
			doc.setSimpleEndDate(ft.format(endDate));
			
		} else if("B".equals(doc.getLvCheck())) {
			Date appliDate = doc.getLvAppli();
			Date startDate = doc.getLvStart();
			Date endDate = doc.getLvEnd();
			
			doc.setSimpleAppliDate(ft.format(appliDate));
			doc.setSimpleStartDate(ft.format(startDate));
			doc.setSimpleEndDate(ft.format(endDate));
		}
		
		model.addAttribute("docInfo", doc);
		
		pd.setProcNo(doc.getProcNo());
		
		// 결재자 정보 결재선 테이블
		List<ProcessDto> processList = service.selectProcess(pd);
		model.addAttribute("processList", processList);
		
		return "ea/user/ea_entirelist_detail";
	}
	
}
