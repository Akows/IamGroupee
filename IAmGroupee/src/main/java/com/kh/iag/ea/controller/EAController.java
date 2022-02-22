package com.kh.iag.ea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/ea")
public class EAController {
	
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
	
	// 기안문서조회 (리스트)
	@GetMapping(value = "/signuplist")
	public String signuplist() {
		return "ea/user/ea_signuplist_list";
	}
	// 기안문서조회 (상세조회)
//	@GetMapping(value = "/")
//	public String signuplistDetail() {
//		return "ea/user/ea_signuplist_detail";
//	}
}
