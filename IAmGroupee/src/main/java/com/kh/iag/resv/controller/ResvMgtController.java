package com.kh.iag.resv.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iag.resv.entity.JsonResult;
import com.kh.iag.resv.service.ResvMgtService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("admin/resv")
public class ResvMgtController {

	@Autowired
	private ResvMgtService service;
	
	//예약관리메인페이지
	@GetMapping("main")
	public String main() {
		return "resv/resvMgt";
	}
	
	//회의실 리스트 보여주기
	@SuppressWarnings("finally")
	@ResponseBody
	@GetMapping(value = "/api", produces = "application/json")
    public Object rlist(Model model, @RequestParam Map<String , String> filter) throws Exception {
		
		JsonResult room =  new JsonResult();
		
		try{
			room.setStatus("ok");
			room.setData(service.getRoomList(filter));
			System.out.println(room);
		}catch(Exception e){
			    e.printStackTrace();
		}finally{
			return room;
		}
    }
	
	//비품 리스트 보여주기
	@SuppressWarnings("finally")
	@ResponseBody
    @GetMapping(value = "/asset", produces = "application/json")
    public Object alist(Model model, @RequestParam Map<String , String> filter) throws Exception {
		
		JsonResult asset =  new JsonResult();
		
		try{
			asset.setStatus("ok");
			asset.setData(service.getAssetList(filter));
		}catch(Exception e){
			    e.printStackTrace();
		}finally{
			return asset;
		}
    }
//	@GetMapping("main/list")
//	@ResponseBody
//	public String list(Model model, RoomDto room, AssetDto asset) throws Exception {
//		List<RoomDto> rList = service.getRoomList(room);
//		List<AssetDto> aList = service.getAssetList(asset);
//		
//		
//		model.addAttribute("rList", rList);
//		model.addAttribute("aList", aList);
//		
//		System.out.println(rList);
//		System.out.println(aList);
//		
//		return "" ;
//	}

	//자산 추가
	
	//자산 수정
	
	//자산 삭제
}
