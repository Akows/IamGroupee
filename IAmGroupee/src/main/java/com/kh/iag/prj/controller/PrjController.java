package com.kh.iag.prj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.prj.entity.PrjDto;
import com.kh.iag.prj.service.PrjService;

@Controller
@RequestMapping("prj")
public class PrjController {

	@Autowired
	private PrjService service;
	
	//내프로젝트
	@GetMapping("prjMain")
	public String prjMain() {
		
		return "prj/prjMain";
	}
	
	//프로젝트 생성
	@PostMapping("prjMain")
	public String prjMain(PrjDto dto) throws Exception {

		System.out.println(dto);
		
		//int result = service.createPrj(dto);
		
		return "prj/prjMain";
	}
	
	//프로젝트 상세보기
	@GetMapping("prjDetail")
	public String prjDetail() {
		return "prj/prjDetail";
	}
	
	//////////////////////////////////////////////////////////////////////////////////
	
	//부서별프로젝트
	@GetMapping("prjDept")
	public String prjDept() {
		
		return "prj/prjDept";
	}
	
	
	
	
}