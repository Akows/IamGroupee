package com.kh.iag.resv.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.resv.entity.ResvDto;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("resv")
public class ResvController {

	//내예약페이지
	@GetMapping("resvMain")
	public String resvMain(HttpServletRequest request, HttpServletResponse response) {
		UserDto loginUser = (UserDto) request.getSession().getAttribute("loginUser");
		String cookieKey = loginUser.getUserNo();
		String cookieValue = Long.toString(loginUser.getJobNo());
		
		Cookie cookie = new Cookie(cookieKey, cookieValue);
		cookie.setPath("/");
		// 쿠키 삭제
		cookie.setMaxAge(0);

		response.addCookie(cookie);
		
		return "resv/resvMain";
	}
	
	//예약하기
	@PostMapping("resvMain")
	public String resvMain(ResvDto resv) {
		return "resv/resvMain";
	}
	
	//////////////////////////////////////////////////////////////////////////////////
		
	//자산별예약페이지
	@GetMapping("resvAsset")
	public String resvAsset() {
		return "resv/resvAsset";
	}
	
	
}
