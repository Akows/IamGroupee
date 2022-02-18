package com.kh.iag.leave.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminLeaveController {


	@GetMapping("leave/main")
	public String main() {
		return "leave/adminLeaveMain";
	}
}
