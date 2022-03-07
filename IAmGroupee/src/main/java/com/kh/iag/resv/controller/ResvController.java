package com.kh.iag.resv.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.resv.entity.ResvDto;
import com.kh.iag.resv.service.ResvService;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("resv")
public class ResvController {

	@Autowired
	private ResvService service;
	
	//내예약페이지
	@GetMapping("resvMain")
	public String resvMain(HttpSession session, Model model) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		List<ResvDto> roomResvList = service.getRoomResvList(userNo);
		List<ResvDto> assetResvList = service.getAssetResvList(userNo);
		List<ResvDto> roomList = service.getRoomList();
		List<ResvDto> assetList = service.getAssetList();
		
		model.addAttribute("roomList", roomList);
		model.addAttribute("assetList", assetList);
		
		if (roomResvList != null) {
			model.addAttribute("roomResvList", roomResvList);
		}
		if (assetResvList != null) {
			model.addAttribute("assetResvList", assetResvList);
		}
		
		return "resv/resvMain";
	}
	
	//예약신청
	@PostMapping("resvMain")
	public String insertResv(Model model, ResvDto dto) throws Exception {

		String[] parts = dto.getPeriod().split("~");
		String part1 = parts[0]; 
		String part2 = parts[1];
		
		SimpleDateFormat transFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm");
		Date start = (Date) transFormat.parse(part1);
		Date end = (Date) transFormat.parse(part2);
		
		java.util.Date utilStart = new java.util.Date();
	    java.sql.Date sqlStart = new java.sql.Date(utilStart.getTime());
	    
	    java.util.Date utilEnd = new java.util.Date();
	    java.sql.Date sqlEnd = new java.sql.Date(utilEnd.getTime());
	    
		dto.setResvStart(sqlStart);
		dto.setResvEnd(sqlEnd);
		System.out.println(dto);
		
		int result = service.insertResv(dto);

		return "redirect:/resv/resvMain";
	}
	
	//////////////////////////////////////////////////////////////////////////////////
		
	//자산별예약페이지
	@GetMapping("resvAsset")
	public String resvAsset(Model model) throws Exception {
		
		
		return "resv/resvAsset";
	}

	
}
