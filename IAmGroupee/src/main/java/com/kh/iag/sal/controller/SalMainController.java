package com.kh.iag.sal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SalMainController 
{
	@GetMapping("salarymain")
	public String salarymain()
	{
		return "sal/salmain";
	}
}
