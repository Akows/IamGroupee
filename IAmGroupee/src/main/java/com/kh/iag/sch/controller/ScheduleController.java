package com.kh.iag.sch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("sch")
public class ScheduleController {

	// 내 캘린더 보여주기
	@GetMapping("mySch")
	public String schMain() {
		return "sch/mySch";
	}
	
	// 캘린더 예제 페이지
	@GetMapping("calendar")
	public String calendar() {
		return "sch/calendar";
	}
}
