package com.kh.iag.resv.controller;

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
		String start = parts[0]; 
		String end = parts[1];
		//par1 =  '2022-03-08 08:00'
		
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//		java.util.Date start = transFormat.parse(part1);
//		java.util.Date end = transFormat.parse(part2);
//		System.out.println("start : "+ start);
//		
//		long timeInMilliSeconds1 = start.getTime();
//		long timeInMilliSeconds2 = start.getTime();
//		java.sql.Date sqlStart = new java.sql.Date(timeInMilliSeconds1);
//		java.sql.Date sqlEnd = new java.sql.Date(timeInMilliSeconds2);
		
		
//	    Date sqlStart = new Date(start.getTime());
//	    Date sqlEnd = new Date(end.getTime());
//	    System.out.println("sqlStart : "+ sqlStart);
		
//		Timestamp tStart = new Timestamp(start.getTime());
//		Timestamp tEnd =  new Timestamp(end.getTime());
//		System.out.println("tstart : "+ tStart);
//	    
		dto.setResvStart(start);
		dto.setResvEnd(end);
		System.out.println(dto);
		
		int result = service.insertResv(dto);

		return "/resv/resvMain";
	}
	
	//////////////////////////////////////////////////////////////////////////////////
		
	//자산별예약페이지
	@GetMapping("resvAsset")
	public String resvAsset(Model model) throws Exception {
		
		
		return "resv/resvAsset";
	}

	
}
