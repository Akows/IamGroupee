package com.kh.iag.attend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AttendViewController 
{
	@GetMapping("attendview")
	public String attendview()
	{
		return "attend/attendview";
	}
}
