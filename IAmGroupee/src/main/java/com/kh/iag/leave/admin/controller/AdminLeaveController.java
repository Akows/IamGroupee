package com.kh.iag.leave.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/leave")
public class AdminLeaveController {
//============================= 관리자 메뉴 =============================	
	
	@GetMapping("main") // 관리 메인
	public String main() {
		return "leave/lvAdmin/adminLeaveMain";
	}
	
	@GetMapping("usAlvAD") // 사원 연차 관리 (JSP없음)
	public String usAlvAD() {
		return "leave/lvAdmin/usAlvAD";
	}
	
	@GetMapping("lvModiAD") // 휴가 발생 관리 (JSP없음)
	public String lvModiAD() {
		return "leave/lvAdmin/lvModiAD";
	}
	
	@GetMapping("lvInfoAD") // 휴무 정보 게시글
	public String lvInfoAD() {
		return "leave/lvAdmin/lvInfoAD";
	}
	
	@GetMapping("alvIntendAD") // 연차 사용 촉구서 (JSP없음)
	public String alvIntendAD() {
		return "leave/lvAdmin/alvIntendAD";
	}
	
}
