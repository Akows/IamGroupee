package com.kh.iag.resv.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.resv.entity.ResvDto;
import com.kh.iag.resv.service.ResvService;

@Controller
@RequestMapping("resv")
public class ResvController {

	@Autowired
	private ResvService service;
	
	//내예약페이지
	@GetMapping("resvMain")
	public String resvMain() {
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
	public String resvAsset() {
		return "resv/resvAsset";
	}
	
	
}
