package com.kh.iag.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.mypage.service.myPageService;
import com.kh.iag.ps.admin.entity.UserDto;

@Controller
@RequestMapping("/my")
public class myPageController {
	
	@Autowired
	private myPageService service;
	
	@GetMapping("/modiuser")
	public String modiuser(HttpSession session, Model model) throws Exception{
		com.kh.iag.user.entity.UserDto loginUser = (com.kh.iag.user.entity.UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		UserDto userDto = service.getUser(userNo);
		model.addAttribute("user", userDto);
		return "mypage/personalInfo";
	}
	
	@PostMapping("/modiuser")
	public String modiuser(@ModelAttribute UserDto user,HttpServletRequest req) throws Exception{
		int result = service.userUpdate(user, req);
		if(result >0) {
			return "redirect:/main";
		} else {
			return "redirect:/my/modiuser";
		}
	}
	
	@GetMapping("/addrbook")
	public String addrbook(HttpSession session, Model model) throws Exception {
		com.kh.iag.user.entity.UserDto loginUser = (com.kh.iag.user.entity.UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		
		return "mypage/addrbook";
	}
}
