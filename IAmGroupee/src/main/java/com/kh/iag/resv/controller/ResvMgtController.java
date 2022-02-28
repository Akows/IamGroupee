package com.kh.iag.resv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/resv")
public class ResvMgtController {

	//예약관리페이지
	@GetMapping("main")
	public String main() {
		return "resv/resvMgt";
	}
}
