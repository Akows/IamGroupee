package com.kh.iag.attend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.service.attendService;

@Controller
@RequestMapping("attend")
public class AttendViewController 
{
	@GetMapping("attendview")
	public String attendView()
	{
		return "attend/attendview";
	}
	
	@PostMapping("attendmodify")
	public String attendModify(AttendModDTO modDTO)
	{
		
//		int result = attendService.attendModify(modDTO);
		
		
		
		return "attend/attendview";
	}
}
