package com.kh.iag.attend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.attend.entity.AttendWTDTO;
import com.kh.iag.attend.service.attendService;

@Controller
@RequestMapping("attend")
public class AttendStateController 
{
	@Autowired
	private attendService service;
	
	@GetMapping("attendstate")
	public String attendState(Model model)
	{
		List<AttendWTDTO> ATList = service.getAllAttendINfo();
		List<AttendWTDTO> WTList = service.getAllAttendWTInfo();
		
		model.addAttribute("ATInfo", ATList);
		model.addAttribute("WTInfo", WTList);
		
		return "attend/attendstate";
	}
}
