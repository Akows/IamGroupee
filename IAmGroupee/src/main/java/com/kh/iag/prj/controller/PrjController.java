package com.kh.iag.prj.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("prj")
public class PrjController {

	//내프로젝트
	@GetMapping("prjMain")
	public String prjMain(HttpServletRequest request, HttpServletResponse response) {
		UserDto loginUser = (UserDto) request.getSession().getAttribute("loginUser");
		String cookieKey = Long.toString(loginUser.getUserNo());
		String cookieValue = Long.toString(loginUser.getJobNo());
		
		Cookie cookie = new Cookie(cookieKey, cookieValue);
		cookie.setPath("/");
		// 쿠키 삭제
		cookie.setMaxAge(0);

		response.addCookie(cookie);
		
		return "prj/prjMain";
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////////////
	
	//부서별프로젝트
	@GetMapping("prjDept")
	public String prjDept(HttpServletRequest request, HttpServletResponse response) {
		UserDto loginUser = (UserDto) request.getSession().getAttribute("loginUser");
		String cookieKey = Long.toString(loginUser.getUserNo());
		String cookieValue = Long.toString(loginUser.getJobNo());
		
		Cookie cookie = new Cookie(cookieKey, cookieValue);
		cookie.setPath("/");
		// 쿠키 삭제
		cookie.setMaxAge(0);

		response.addCookie(cookie);
		
		return "prj/prjDept";
	}
	
	
	
	
}