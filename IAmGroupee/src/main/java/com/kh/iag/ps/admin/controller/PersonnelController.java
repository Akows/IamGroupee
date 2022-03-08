package com.kh.iag.ps.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iag.ps.admin.entity.PageVo;
import com.kh.iag.ps.admin.entity.UserDto;
import com.kh.iag.ps.admin.entity.departmentDto;
import com.kh.iag.ps.admin.entity.jobDto;
import com.kh.iag.ps.admin.entity.positionDto;
import com.kh.iag.ps.admin.entity.psCountDto;
import com.kh.iag.ps.admin.service.personnelService;


@Controller
@RequestMapping("/admin/ps")
public class PersonnelController {
	@Autowired
	private personnelService service;

	@GetMapping("/main")
	public String main(Model model) throws Exception {
		psCountDto psCnt = service.psCount();
		model.addAttribute("psCnt", psCnt);
		return "ps/main";
	}
	
	
//	임직원 목록
	@GetMapping(value = {"/userlist/{page}", "/userlist"})
	public String userlist(@PathVariable(required = false) String page, String search,Model model) throws Exception{
		PageVo pv = service.getPageVo(page,search);
		List<UserDto> userList = service.getUserList(pv);
		List<positionDto> posiList = service.posiList();
		List<jobDto> jobList = service.jobList();
		List<departmentDto> deptList = service.deptList();
		model.addAttribute("posiList", posiList);
		model.addAttribute("jobList", jobList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("userList", userList);
		model.addAttribute("pv", pv);
		return "ps/userlist";
	}
	
//	부서 관리
	@GetMapping("/deptmanage")
	public String deptmanage(Model model) throws Exception{
		List<departmentDto> deptList = service.deptList();
		model.addAttribute("deptList", deptList);
		return "ps/deptmanage";
	}
	
//	직무/직위 관리
	@GetMapping("/jobposimanage")
	public String jobposimanage(Model model) throws Exception{
		List<positionDto> posiList = service.posiList();
		List<jobDto> jobList = service.jobList();
		int lastLevel = service.getLastLevel(posiList);
		model.addAttribute("posiList", posiList);
		model.addAttribute("jobList", jobList);
		model.addAttribute("lastLevel", lastLevel);
		return "ps/jobposimanage";
	}
	
//  임직원 추가
	@GetMapping("/userenroll")
	public String userenroll(Model model) throws Exception {
		List<positionDto> posiList = service.posiList();
		List<jobDto> jobList = service.jobList();
		List<departmentDto> deptList = service.deptList();
		model.addAttribute("posiList", posiList);
		model.addAttribute("jobList", jobList);
		model.addAttribute("deptList", deptList);
		return "ps/userenroll";
	}
	
//  임직원 추가 post
	@PostMapping("/userenroll")
	public String userenroll(@ModelAttribute UserDto user,HttpServletRequest req) throws Exception {
		int result = service.userEnroll(user, req);
		if(result >0) {
			return "redirect:/admin/ps/userlist";
		} else {
			return "redirect:/admin/ps/userenroll";
		}
		
	}
	
	@PostMapping("/dupCheck")
	@ResponseBody
	public String dupCheck(String userNo) throws Exception {
		int result = service.dupCheck(userNo);
		
		if(result == 1) {
			return "false";
		} else {
			return "true";
		}
	}
	
	@PostMapping("/userModi")
	public String userModi(@ModelAttribute UserDto user,HttpServletRequest req) throws Exception {
		int result = service.userUpdate(user, req);
		return "redirect:/admin/ps/userlist";
	}
	
}
