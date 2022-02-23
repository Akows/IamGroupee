package com.kh.iag.attend.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.service.attendService;

@Controller
@RequestMapping("attend")
public class AttendMainController 
{
	@GetMapping("attendmain")
	public String attendMain()
	{
		return "attend/attendmain";
	}
	
	private attendService as;
	
	@PostMapping("attendmain")
	public String attendMainPage()
	{
//		List<AttendDTO> attendList = as.selectAttend();
		
		
		return "attend/attendmain";
	}
}
