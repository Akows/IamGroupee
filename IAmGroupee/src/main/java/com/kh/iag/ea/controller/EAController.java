package com.kh.iag.ea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iag.ea.admin.service.AdminEAService;
import com.kh.iag.ea.entity.CategoryDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.service.EAService;

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
	public String write(Model model, @ModelAttribute FormDto dto) {
		log.info(dto.toString());
		// 기안 신청시 작성하는 양식 데이터
		FormDto formValue = service.signupFormValue(dto);
		model.addAttribute("formValue", formValue);
		
		return "ea/user/ea_signup_write";
	}
	// 기안신청 (처리)
//	@PostMapping(value = "/write")
//	public String write() {
//		
//		// 완료후 기안문서조회 상세 페이지로
//		return "ea/user/ea_signuplist_detail";
//	}
//---------------------------------------------------------------- 기안문서조회
	// 기안문서조회 (리스트)
	@GetMapping(value = "/signuplist")
	public String signuplist() {
		return "ea/user/ea_signuplist_list";
	}
	// 기안문서조회 (상세조회) -> PathValue사용해서 쿼리스트링 말고 "/" 문서번호구분으로 받아오기
	@GetMapping(value = "/signuplist/detail")
	public String signuplistDetail(String process) {
		// 반려 문서시 내용 수정하여 다시 기안할 수 있는 페이지로 이동
		System.out.println(process);
		if((process.equals("반려")))
			return "ea/user/ea_signuplist_rejected";
		else
			return "ea/user/ea_signuplist_detail";
	}

//---------------------------------------------------------------- 결재문서조회
	// 결재문서조회 (리스트)
	@GetMapping(value = "/apprlist")
	public String apprlist() {
		return "ea/user/ea_apprlist_list";
	}
	// 결재문서조회 (상세조회)
	@PostMapping(value = "/apprlist/detail")
	public String apprlistDetail() {
		return "ea/user/ea_apprlist_detail";
	}
	// 결재문서조회 (결재진행)
	@PostMapping(value = "/apprlist/process")
	public String apprlisApprved(String process) {
		System.out.println(process);
		return "ea/user/ea_apprlist_list";
	}
}
