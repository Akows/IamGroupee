package com.kh.iag.resv.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		List<ResvDto> allRoomResv = service.getAllRoomResvList();
		List<ResvDto> allAssetResv = service.getAllAssetResvList();
		
		model.addAttribute("allRoomResv", allRoomResv);
		model.addAttribute("allAssetResv", allAssetResv);
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
    
		dto.setResvStart(start);
		dto.setResvEnd(end);
		System.out.println("insert dto ::::" + dto);
		
		int result = service.insertResv(dto);

		return "redirect:/resv/resvMain";
	}
	
	//예약수정
	@PostMapping("mod")
	@ResponseBody
	public String modResv() {
		return "mod";
	}
	
	//예약반납
	@PostMapping("return")
	@ResponseBody
	public String returnResv() {
		return "return";
	}
	
	
	//예약삭제
	@PostMapping("delete")
	@ResponseBody
	public String deleteResv() {
		return "delete";
	}
	
	//////////////////////////////////////////////////////////////////////////////////
		
	//자산별예약페이지
	@GetMapping("resvAsset")
	public String resvAsset(Model model) throws Exception {
		
		
		return "resv/resvAsset";
	}

	
}
