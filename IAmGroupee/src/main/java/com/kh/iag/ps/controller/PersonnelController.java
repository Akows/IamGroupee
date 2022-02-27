package com.kh.iag.ps.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/ps")
public class PersonnelController {

	@GetMapping("/main")
	public String main() {
		return "ps/main";
	}
	
	
//	임직원 목록
	@GetMapping("/userlist")
	public String userlist(){
		return "ps/userlist";
	}
	
//	부서 관리
	@GetMapping("/deptmanage")
	public String deptmanage(){
		return "ps/deptmanage";
	}
	
//	직무/직위 관리
	@GetMapping("/jobposimanage")
	public String jobmanage(){
		return "ps/jobposimanage";
	}
	
//  임직원 추가
	@GetMapping("/userenroll")
	public String userenroll() {
		return "ps/userenroll";
	}
	
}
