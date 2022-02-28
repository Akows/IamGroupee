package com.kh.iag.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@EnableAspectJAutoProxy
@Aspect
@Component
@Slf4j
public class RightAspect {

	@Before("execution(public String com.kh.iag.leave.admin.controller.AdminLeaveController.*(..))")
	public boolean AdminLeave() throws Exception {
		HttpSession session = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getResponse();
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");

		if ("Y".equals(loginUser.getLeaveRight())) {
			return true;
		} else {
			response.sendRedirect("/iag/wrongRight");
			return false;
		}
	} 

	@Before("execution(public String com.kh.iag.ea.admin.controller.AdminEAController.*(..))")
	public boolean AdminEa() throws Exception {
		HttpSession session = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getResponse();
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");

		if ("Y".equals(loginUser.getPaymentRight())) {
			return true;
		} else {
			response.sendRedirect("/iag/wrongRight");
			return false;
		}
	} 

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


