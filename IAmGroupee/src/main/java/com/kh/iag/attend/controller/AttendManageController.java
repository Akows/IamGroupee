package com.kh.iag.attend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AttendManageController 
{
	@GetMapping("attendmanage")
	public String attendmanage()
	{
		return "attend/attendmanage";
	}
}
