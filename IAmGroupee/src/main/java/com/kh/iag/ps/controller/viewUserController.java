package com.kh.iag.ps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.ps.admin.entity.UserDto;
import com.kh.iag.ps.admin.entity.departmentDto;
import com.kh.iag.ps.admin.service.personnelService;

@Controller
@RequestMapping("/ps")
public class viewUserController {

	@Autowired
	private personnelService service;
	
	@GetMapping("/viewuser")
	public String viewuser(Model model) throws Exception {
		List<departmentDto> deptList = service.deptManageList();	
		List<UserDto> userList = service.getUserList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("userList", userList);
		return "ps/viewuser";
	}
}
