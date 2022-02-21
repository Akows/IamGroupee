package com.kh.iag.attend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AttendMainController 
{
	@GetMapping("attendmain")
	public String attendmain()
	{
		return "attend/attendmain";
	}
}
