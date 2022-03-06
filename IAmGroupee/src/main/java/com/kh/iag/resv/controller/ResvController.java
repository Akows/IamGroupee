package com.kh.iag.resv.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.leave.entity.LvUsedListDto;
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
		System.out.println("room : " + roomResvList);
		System.out.println("asset : " + assetResvList);
		
		if (roomResvList != null) {
			model.addAttribute("roomResvList", roomResvList);
		}
		if (assetResvList != null) {
			model.addAttribute("assetResvList", assetResvList);
		}
		
		return "resv/resvMain";
	}
	
//	//일정보기
//	@GetMapping( value = "resvList", produces = "application/json")
//	public String data(Model model) {
//		try {
//			model.addAttribute("list", service.getResvList());
//			System.out.println(service.getResvList());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null; 
//    }
	
	
	@PostMapping("resvMain")
	public String resvMain(ResvDto resv) {
		return "resv/resvMain";
	}
	
	//////////////////////////////////////////////////////////////////////////////////
		
	//자산별예약페이지
	@GetMapping("resvAsset")
	public String resvAsset(Model model) throws Exception {
//		List<ResvDto> rResvList = service.getRResvList()
		
		return "resv/resvAsset";
	}

	
}
