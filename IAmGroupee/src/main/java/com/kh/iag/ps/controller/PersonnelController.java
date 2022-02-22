package com.kh.iag.ps.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/ps")
public class PersonnelController {

	@GetMapping("/main")
	public String main() {
		return "ps/main";
	}
}
