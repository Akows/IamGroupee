package com.kh.iag.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iag.mypage.entity.addressBookDto;
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
		List<addressBookDto> adBookList = service.getAdBook(userNo);
		List<UserDto> allUserList = service.getAllUser();
		model.addAttribute("bookList", adBookList);
		model.addAttribute("allUserList", allUserList);
		return "mypage/addrbook";
	}
	
	@GetMapping("/addBook")
	public String addBook(@ModelAttribute addressBookDto book, HttpSession session) throws Exception {
		com.kh.iag.user.entity.UserDto loginUser = (com.kh.iag.user.entity.UserDto) session.getAttribute("loginUser");
		book.setUserNo(loginUser.getUserNo());
		int result = service.addBook(book);
		
		if(result>0) {
			return "redirect:/my/addrbook";
		}else {
			return "redirect:/main";
		}
	}
	
	@GetMapping("/bookDelete")
	@ResponseBody
	public String bookDelete(int addressNo) throws Exception {
		int result =service.delBook(addressNo);
		if(result >0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	@GetMapping("/bookNameModi")
	public String bookNameModi(@ModelAttribute addressBookDto book) throws Exception {
		int result = service.bookNameModi(book);
		
		if(result>0) {
			return "redirect:/my/addrbook";
		}else {
			return "redirect:/main";
		}
	}
	
	@GetMapping("/bookUserModi")
	public String bookUserModi(@ModelAttribute addressBookDto book) throws Exception {
		int result = service.bookUserModi(book);
		int val = book.getUser().length;
		if(result==val) {
			return "redirect:/my/addrbook";
		}else {
			return "redirect:/main";
		}
	}
}
