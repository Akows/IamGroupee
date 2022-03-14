package com.kh.iag.prj.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.prj.entity.PrjDto;
import com.kh.iag.prj.service.PrjService;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("prj")
public class PrjController {

	@Autowired
	private PrjService service;
	
	//내프로젝트
	@GetMapping("prjMain")
	public String prjMain(HttpSession session, Model model) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		int departNo = (int) loginUser.getDepartmentNo();
		
		List<PrjDto> prjList = service.getPrjList(departNo);
		model.addAttribute("prjList", prjList);
		
		return "prj/prjMain";
	}
	
	//프로젝트 생성
	@PostMapping("prjMain")
	public String createPrj(PrjDto dto) throws Exception {

		System.out.println(dto);
		String[] parts = dto.getPeriod().split("~");
		String start = parts[0]; 
		String end = parts[1];
    
		dto.setStartDate(start);
		dto.setEndDate(end);
		
		if(dto.getActivateYn() != null) {
			dto.setActivateYn("Y");
		}else {
			dto.setActivateYn("N");
		}
		
		if(dto.getOpenYn() != null) {
			dto.setOpenYn("Y");
		}else {
			dto.setOpenYn("N");
		}
		
		String name = dto.getUserNo();
		String userNo = service.getUserNo(name);
		dto.setUserNo(userNo);
		
		System.out.println(dto);
			
		int result = service.createPrj(dto);
		
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