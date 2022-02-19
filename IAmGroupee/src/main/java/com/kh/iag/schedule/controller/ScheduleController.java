package com.kh.iag.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("sch")
public class ScheduleController {

	// 내 캘린더 보여주기
	@GetMapping("mySch")
	public String schMain() {
		return "sch/mySch";
	}
}
