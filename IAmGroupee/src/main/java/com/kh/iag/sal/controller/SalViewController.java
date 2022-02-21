package com.kh.iag.sal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SalViewController 
{
	@GetMapping("salaryview")
	public String salaryview()
	{
		return "sal/salview";
	}
}
