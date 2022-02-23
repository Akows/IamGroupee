package com.kh.iag.leave.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.iag.leave.service.LeaveService;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("leave")
public class LeaveController {
	
	@Autowired
	private LeaveService service;
	
//============================= 사용자, 관리자 메뉴 =============================	
	@GetMapping("leaveMain")  // 연차 메인
	public String leaveMain(HttpServletRequest request, HttpServletResponse response) {		
		return "leave/leaveMain";
	}
	
	@GetMapping("lvUsedList") // 연차 및 휴가 사용대장
	public String lvUsedList() {
		return "leave/lvUsedList";
	}
	
	@GetMapping("alvCal") // 연차 정산
	public String alvCal() {
		return "leave/alvCal";
	}

//============================= 사용자 메뉴 =============================	
	@GetMapping("lvInfo") // 사용자 휴무 정보 게시글
	public String lvInfo() {
		
//		service.getLeaveList();
		
		
		return "leave/leaveInfo";
	}
	@GetMapping("lvInfoDetail") // 사용자 휴무 정보 상세페이지
	public String lvInfoDetail() {
		
//		service.getLeaveList();
		
		
		return "leave/lvInfoDetail";
	}

	
	
	
}
