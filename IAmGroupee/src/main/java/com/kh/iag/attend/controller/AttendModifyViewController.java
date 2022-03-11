package com.kh.iag.attend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.service.attendService;

@Controller
@RequestMapping("attend")
public class AttendModifyViewController 
{
	@Autowired
	private attendService service;
	
	@GetMapping("attendmodview")
	public String attendModView(Model model) throws Exception 
	{
		List<AttendModDTO> atModList = service.getModList();
		model.addAttribute("atModList", atModList);
		
		return "attend/attendmodview";
	}
}
