package com.kh.iag.ea.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "admin/ea")
public class AdminEAController {
	
	// 전자결재 관리자 메인 페이지
	@GetMapping(value = "/main")
	public String main() {
		return "ea/admin/ea_admin_main";
	}
}
