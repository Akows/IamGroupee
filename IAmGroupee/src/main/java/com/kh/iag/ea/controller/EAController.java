package com.kh.iag.ea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/ea")
public class EAController {
	
	@GetMapping(value = "/signup")
	public String signUp() {
		return "ea/signup";
	}
	@GetMapping(value = "/write")
	public String write() {
		return "ea/write";
	}
}
