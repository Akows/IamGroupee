package com.kh.iag.ea.admin.controller;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
@Aspect
@EnableAspectJAutoProxy
public class UpdateCloseDocAspect {
	
	@Autowired
	SqlSession sqlSession;
	
	@Before("target(com.kh.iag.ea.admin.controller.AdminEAController)")
	public void updateCloseDocAdmin() {
		int rrr = sqlSession.update("ea.updateCloseDoc");
	}
	@Before("target(com.kh.iag.ea.controller.EAController)")
	public void updateCloseDocUser() {
		int rrr = sqlSession.update("ea.updateCloseDoc");
	}
}
// 마감기한 지난 문서 DOC_SEP = 'Y'로 변경