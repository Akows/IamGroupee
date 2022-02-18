package com.kh.iag.main.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.iag.user.entity.UserDto;
import com.kh.iag.user.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
	@Autowired
	private UserService service;
	
	// 로그인 화면
	@GetMapping("login")
	public String home() {
		
		return "login";
	}
	// 로그인 처리
	@PostMapping("login")
	public String home(UserDto dto, HttpSession session, HttpServletResponse response) throws Exception {
		UserDto loginUser = service.login(dto);
		
		String cookieKey = Long.toString(loginUser.getUserNo());
		String cookieValue = Long.toString(loginUser.getJobNo());
		
		if (loginUser != null) {
			//세션에 담기
			session.setAttribute("loginUser",loginUser);
			// 쿠키 생성
			Cookie cookie = new Cookie(cookieKey, cookieValue);
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24);
			
			response.addCookie(cookie);
			
			return "redirect:/main";
		} else {
			//실패
			return "login";
		}
	}
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	

	@GetMapping("main")
	public String main(HttpSession session, HttpServletRequest req) {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		if (loginUser == null) {
			req.setAttribute("msg", "로그인을 먼저 해주세요");
			return "login";
		} else {
			return "mainPage";
		}
	}
	@GetMapping("main2")
	public String main2() {
		
		return "common/error/error404";
	}
	
}
