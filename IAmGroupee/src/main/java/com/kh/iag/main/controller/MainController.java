package com.kh.iag.main.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.iag.login.service.LoginService;
import com.kh.iag.login.vo.CheckedVo;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
	@Autowired
	private LoginService service;
	
	// 로그인 화면
	@GetMapping("login")
	public String login(HttpServletRequest request) {
		return "login";
	}
	
	// 로그인 처리
	@PostMapping("login")
	public String login(UserDto dto, HttpSession session, HttpServletResponse response, HttpServletRequest request, CheckedVo checkedVo) throws Exception {

			// 세션에 담기 전에 세션 초기화
			if ( session.getAttribute("loginUser") != null ){
				session.removeAttribute("loginUser"); 
			}
			// 로그인 로직
			UserDto loginUser = service.login(dto);
			if (loginUser != null) {
				//세션에 담기
				session.setAttribute("loginUser",loginUser);
				
//				============연차 발생
				
				
				
				
				
				
				
				
				
				
				
				
				
				String[] checkedValues = checkedVo.getChecked();
				if(checkedValues != null) {
					String checkedValue = "";
					
					for(String cv : checkedValues) {
						checkedValue += cv;
						if(checkedValue.equals("numlogin") || checkedValue.equals("loginnum")) {
							// 자동 로그인 쿠키 생성
							Cookie savedLoginCookie = new Cookie("savedLoginCookie", session.getId());
							savedLoginCookie.setPath("/");
							int savedTime = 60 * 60 * 24;
							savedLoginCookie.setMaxAge(savedTime);
							
							Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * savedTime));
							
							// loginUser 디비에 sessionKey랑 sessionLimit시간 update하기
							int ssResult = service.savedLoginCookie(loginUser.getUserNo(), session.getId(), sessionLimit);
							
							// 화면에 보낸다.
							response.addCookie(savedLoginCookie);
							
							// 보름 간 아이디 저장 쿠키 생성
							Cookie rememIdCookie = new Cookie("rememIdCookie", String.valueOf(loginUser.getUserNo()));
							rememIdCookie.setPath("/");
							rememIdCookie.setMaxAge(60 * 60 * 24 * 15);
							
							response.addCookie(rememIdCookie);
							
						} else if (checkedValue.equals("num")) {
							// 보름 간 아이디 저장 쿠키 생성
							Cookie rememIdCookie = new Cookie("rememIdCookie", String.valueOf(loginUser.getUserNo()));
							rememIdCookie.setPath("/");
							rememIdCookie.setMaxAge(60 * 60 * 24 * 15);
							
							response.addCookie(rememIdCookie);
							
						} else if (checkedValue.equals("login")) {
							// 현재 rememIdCookie가 있다면 지우기
							Cookie[] cookies = request.getCookies();
							
							for(int i = 0; i<cookies.length; i++){
								String name = cookies[i].getName();
								String value = cookies[i].getValue();
								if(name.equals("rememIdCookie")){
									cookies[i].setPath("/");
									cookies[i].setMaxAge(0);
									response.addCookie(cookies[i]);
								}
							}
							// 자동 로그인 쿠키 생성
							Cookie savedLoginCookie = new Cookie("savedLoginCookie", session.getId());
							savedLoginCookie.setPath("/");
							int savedTime = 60 * 60 * 24;
							savedLoginCookie.setMaxAge(savedTime);
							
							Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * savedTime));
							
							// loginUser 디비에 sessionKey랑 sessionLimit시간 update하기
							int ssResult = service.savedLoginCookie(loginUser.getUserNo(), session.getId(), sessionLimit);
							
							response.addCookie(savedLoginCookie); // 화면에 보낸다.
						}
					}
					return "redirect:/main";
				} else {
					Cookie[] cookies = request.getCookies();
					
					for(int i = 0; i<cookies.length; i++){
						String name = cookies[i].getName();
						String value = cookies[i].getValue();
						if(name.equals("rememIdCookie")){
							cookies[i].setPath("/");
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}
					}
					return "redirect:/main";
				}
			} 
				//실패
			return "redirect:/login";
//			return "login";
			
		}

	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 자동로그인 쿠키 삭제
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i<cookies.length; i++){
			String name = cookies[i].getName();
			String value = cookies[i].getValue();
			if(name.equals("savedLoginCookie")){
				cookies[i].setPath("/");
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		
		// user db의 sessionLimit을 현재시간으로 다시 변경
		Date date = new Date(System.currentTimeMillis());
		service.savedLoginCookie(loginUser.getUserNo(), session.getId(), date);
		// 세션만료
		session.invalidate();
		
		return "redirect:/login";
	}
	
	
	// 메인주소 입력 시
	@GetMapping("main")
	public String main(HttpSession session, HttpServletRequest req) {
		return "mainPage";
	}
	
	
	// 관리자 권한이 없을 시
	@GetMapping("wrongRight")
	public String main2() {
		
		return "common/error/wrongRight";
	}
	
}
