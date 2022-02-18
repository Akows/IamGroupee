package com.kh.iag.leave.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("leave")
public class LeaveController {

	@GetMapping("leaveMain")
	public String leaveMain(HttpServletRequest request, HttpServletResponse response) {
		UserDto loginUser = (UserDto) request.getSession().getAttribute("loginUser");
		String cookieKey = Long.toString(loginUser.getUserNo());
		String cookieValue = Long.toString(loginUser.getJobNo());
		
		Cookie cookie = new Cookie(cookieKey, cookieValue);
		cookie.setPath("/");
		// 쿠키 삭제
		cookie.setMaxAge(0);

		response.addCookie(cookie);
		
		return "leave/leaveMain";
	}
}
