package com.kh.iag.ea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/ea")
public class EAController {
	
//---------------------------------------------------------------- 기안신청
	// 기안신청 (양식선택)
	@GetMapping(value = "/signup")
	public String signUp() {
		return "ea/user/ea_signup_form";
	}
	// 기안신청 (기안작성)
	@GetMapping(value = "/write")
	public String write() {
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
}
