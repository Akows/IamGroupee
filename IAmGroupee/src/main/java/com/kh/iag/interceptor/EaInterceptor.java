package com.kh.iag.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.iag.user.entity.UserDto;

public class EaInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		UserDto loginUser = (UserDto) request.getSession().getAttribute("loginUser");
		System.out.println(loginUser.getPaymentRight());
		// 해당 도메인에 권한이 있는 지 체크
		if ("Y".equals(loginUser.getPaymentRight())) {
			 return true;
		} else {
			response.sendRedirect("/iag/main2");
			return false;
		}
	}
}
