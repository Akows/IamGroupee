package com.kh.iag.prj.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.prj.entity.PrjDto;
import com.kh.iag.prj.service.PrjService;
import com.kh.iag.resv.entity.PageVo;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("prj")
public class PrjController {

	@Autowired
	private PrjService service;
	
	//내프로젝트
	@GetMapping(value = {"/prjMain/{page}", "prjMain"})
	public String prjMain(HttpSession session, Model model, @PathVariable(required = false) String page) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		
		int departNo = (int) loginUser.getDepartmentNo();
		
		//페이징
		if(page == null) {
			return "redirect:prjMain/1";
		}
		int cntPerPage = 4; //한 페이지당 5개씩 보여주기
		int pageBtnCnt = 3;  //한번에 보여줄 페이지버튼 갯수
		int totalRow = service.getMyPrjCnt(departNo);   //DB 에 있는 모든 row 갯수
		PageVo vo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
		
		//나의 프젝 리스트 불러오기
		List<PrjDto> prjList = service.getPrjList(departNo, vo);
		if(prjList != null) {
			model.addAttribute("prjList", prjList);
			model.addAttribute("page", vo);
		}
		
		return "prj/prjMain";
	}
	
	//프로젝트 생성
	@PostMapping("prjMain")
	public String createPrj(PrjDto dto) throws Exception {

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
		
		int result = service.createPrj(dto);
		
		return "prj/prjMain";
	}
	
	//////////////////////////////////////////////////////////////////////////////////
	
	//프로젝트 상세보기
	@GetMapping(value = {"/prjDetail/{prjNo}", "prjDetail"})
	public String prjDetail(@PathVariable int prjNo, Model model, PrjDto dto) throws Exception {
		
		PrjDto viewPrj = service.viewPrj(prjNo);
		model.addAttribute("viewPrj", viewPrj);
		
		return "prj/prjDetail";
	}
	
	@PostMapping()
	
	//////////////////////////////////////////////////////////////////////////////////
	
	//부서별프로젝트
	@GetMapping("prjDept")
	public String prjDept() {
		
		return "prj/prjDept";
	}
	
	
	
	
}