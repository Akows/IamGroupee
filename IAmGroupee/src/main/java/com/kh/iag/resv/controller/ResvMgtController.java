package com.kh.iag.resv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.resv.entity.AssetDto;
import com.kh.iag.resv.entity.RoomDto;
import com.kh.iag.resv.service.ResvMgtService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("admin/resv")
public class ResvMgtController {

	@Autowired
	private ResvMgtService service;
	
	//자산 리스트 보여주기
	@GetMapping("main")
	public String list(Model model, RoomDto room, AssetDto asset) throws Exception {
		List<RoomDto> rList = service.getRoomList(room);
		List<AssetDto> aList = service.getAssetList(asset);
		model.addAttribute("rList", rList);
		model.addAttribute("aList", aList);
		
		System.out.println(rList);
		System.out.println(aList);
		
		return "resv/resvMgt";
	}

	//자산 추가
	
	//자산 수정
	
	//자산 삭제
}
