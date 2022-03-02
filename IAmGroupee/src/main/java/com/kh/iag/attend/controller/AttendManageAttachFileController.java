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
public class AttendManageAttachFileController 
{
	@Autowired
	private attendService service;
	
	@GetMapping("attachfile")
	public String filePage(Model model) throws Exception
	{ 
		List<AttendModDTO> attendModDTOList = service.getFile();
		
		model.addAttribute("file", attendModDTOList);

		return "attend/attachfile";
	}
}