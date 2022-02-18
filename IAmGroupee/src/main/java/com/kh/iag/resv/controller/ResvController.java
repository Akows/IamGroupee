package com.kh.iag.resv.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("resv")
public class ResvController {

	@GetMapping("resvMain")
	public String resvMain(HttpServletRequest request, HttpServletResponse response) {
		UserDto loginUser = (UserDto) request.getSession().getAttribute("loginUser");
		String cookieKey = Long.toString(loginUser.getUserNo());
		String cookieValue = Long.toString(loginUser.getJobNo());
		
		Cookie cookie = new Cookie(cookieKey, cookieValue);
		cookie.setPath("/");
		// 쿠키 삭제
		cookie.setMaxAge(0);

		response.addCookie(cookie);
		
		return "resv/resvMain";
	}
	
	//////////////////////////////////////////////////////////////////////////////////
		
	//부서별프로젝트
	@GetMapping("resvAsset")
		public String resvAsset(HttpServletRequest request, HttpServletResponse response) {
		UserDto loginUser = (UserDto) request.getSession().getAttribute("loginUser");
		String cookieKey = Long.toString(loginUser.getUserNo());
		String cookieValue = Long.toString(loginUser.getJobNo());
		
		Cookie cookie = new Cookie(cookieKey, cookieValue);
		cookie.setPath("/");
		// 쿠키 삭제
		cookie.setMaxAge(0);
		
		response.addCookie(cookie);
		
		return "resv/resvAsset";
	}
	
	
	
}
