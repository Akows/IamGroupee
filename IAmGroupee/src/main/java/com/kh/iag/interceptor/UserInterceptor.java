package com.kh.iag.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.kh.iag.login.service.LoginService;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class UserInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private LoginService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		if (loginUser == null) {
			System.out.println("loginUser  : " + loginUser );
			Cookie loginedCookie = WebUtils.getCookie(request, "savedLoginCookie");
			if (loginedCookie != null) {
				System.out.println("loginedCookie: " + loginedCookie);
				String sessionKey = loginedCookie.getValue();
				UserDto userDto = service.checkUserBySsKey(sessionKey);
				if (userDto != null) {
					if ("Y".equals(userDto.getPersonnelRight())) {
						System.out.println("yyy");
						return true;
					} else {
						System.out.println("nnn");
						response.sendRedirect("/iag/wrongRight");
						return false;
					}
			    } 
			request.setAttribute("msg", "로그인을 먼저 해주세요");
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
			return false;
		  }
	  }else {
		  if ("Y".equals(loginUser.getPersonnelRight())) {
				return true;
		  } else {
				response.sendRedirect("/iag/wrongRight");
				return false;
			}
	  }
		return true;
    }
}
