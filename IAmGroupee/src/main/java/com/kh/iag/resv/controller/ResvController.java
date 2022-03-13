package com.kh.iag.resv.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iag.resv.entity.PageVo;
import com.kh.iag.resv.entity.ResvDto;
import com.kh.iag.resv.service.ResvService;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("resv")
public class ResvController {

	@Autowired
	private ResvService service;
	
	//내예약페이지
	@GetMapping(value = {"/resvMain/{page}", "resvMain"})
	public String resvMain(HttpSession session, Model model, @PathVariable(required = false) String page) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		//페이징
		if(page == null) {
			return "redirect:resvMain/1";
		}
		
		int cntPerPage = 5; //한 페이지당 5개씩 보여주기
		int pageBtnCnt = 3;  //한번에 보여줄 페이지버튼 갯수
		int totalRow = service.getResvCnt(userNo);   //DB 에 있는 모든 row 갯수
		PageVo vo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);

		//내 예약현황
		List<ResvDto> myResvList = service.getMyResvList(userNo, vo);
		
		if (myResvList != null) {
			for (ResvDto r : myResvList) {
				r.setPeriod(r.getResvStart() + " ~ " + r.getResvEnd());
			}
			model.addAttribute("myResvList", myResvList);
			model.addAttribute("page", vo);
		}
		
		//신청폼 option
		List<ResvDto> roomList = service.getRoomList();
		List<ResvDto> assetList = service.getAssetList();
		model.addAttribute("roomList", roomList);
		model.addAttribute("assetList", assetList);
		
		//캘린더에 표시될 나의 예약현황
		List<ResvDto> myRoomResvList = service.getMyRoomResvList(userNo);
		List<ResvDto> myAssetResvList = service.getMyAssetResvList(userNo);
		if(myRoomResvList != null) {
			model.addAttribute("myRoomResvList", myRoomResvList);
		}
		if(myAssetResvList != null) {
			model.addAttribute("myAssetResvList", myAssetResvList);
			
		}
		
		return "resv/resvMain";
	}
	
	//예약신청
	@RequestMapping(value="resvMain", method = RequestMethod.POST)
	public String insertResv(ResvDto dto, HttpServletRequest req) throws Exception {

		String[] parts = dto.getPeriod().split("~");
		String start = parts[0]; 
		String end = parts[1];
    
		dto.setResvStart(start);
		dto.setResvEnd(end);
		int result = service.insertResv(dto);
		
		return "redirect:/resv/resvMain";
	}
	
	//예약수정
	@RequestMapping(value="mod", method = {RequestMethod.POST})
	public String modResv(ResvDto dto, HttpServletRequest req) throws Exception {
		
		String[] parts = req.getParameter("period").split("~");
		String start = parts[0]; 
		String end = parts[1];
		
		dto.setResvStart(start);
		dto.setResvEnd(end);
		dto.setResvNo(Integer.parseInt(req.getParameter("resvNo")));
		
		System.out.println("after:::" + dto);

		int result = service.modResv(dto);
		
		return "redirect:/resv/resvMain";
		
	}
	
	//예약반납
	@PostMapping("return")
	@ResponseBody
	public String returnResv(String str) throws Exception {
		int result = service.returnResv(str);
		System.out.println(str);
		
		log.warn("return column : {}", result);
		
		if(result == str.length()/2) {
			return "ok";
		}else {
			return "fail_" + result;
		}
	}
	
	
	//예약삭제
	@PostMapping("delete")
	@ResponseBody
	public String deleteResv(String str) throws Exception {
		int result = service.deleteResv(str);
		
		//삭제된 컬럼 수 
		log.warn("delete column : {}", result);
		
		if(result == str.length()/2) {
			return "ok";
		}else {
			return "fail_" + result;
		}
		
	}
	
	//////////////////////////////////////////////////////////////////////////////////
		
	//자산별예약페이지
	@GetMapping("resvAsset")
	public String searchResv(Model model) throws Exception {
		//자산별 option
		List<ResvDto> roomList = service.getRoomList();
		List<ResvDto> assetList = service.getAssetList();
		model.addAttribute("roomList", roomList);
		model.addAttribute("assetList", assetList);
		
		//전체 예약현황
		List<ResvDto> allRoomResvList = service.getAllRoomResvList();
		List<ResvDto> allAssetResvList = service.getAllAssetResvList();
		
		if(allRoomResvList != null) {
			model.addAttribute("allRoomResvList", allRoomResvList);
		}
		if(allAssetResvList != null) {
			model.addAttribute("allAssetResvList", allAssetResvList);
			
		}
		
		return "resv/resvAsset";
	}
	
	//자산별 예약조회
	@GetMapping(value = "resvAsset/r")
	public String searchRoomResv(Model model, HttpServletRequest req) throws Exception{
		
//		String no = req.getParameter(no);
//		int roomNo = Integer.parseInt(no);
//		int resvNo = service.getRoomResvNo(roomNo);
//		System.out.println(resvNo);
//		//회의실별 예약현황
//		List<ResvDto> allRoomResvList = service.getSelectRoomResvList(resvNo);
//		
//		try {
//			model.addAttribute("allRoomResvList", allRoomResvList);
//		} catch (Exception e) {
//	
//		}
		return "redirect:resv/resvAsset";
	}
	
	@PostMapping(value = "resvAsset/a{assetNo}")
	public String searchAssetResv(Model model, @PathVariable int assetNo) throws Exception{
		
		int resvNo = service.getAssetResvNo(assetNo);
		
		//비품별 전체 예약현황
		List<ResvDto> allAssetResvList = service.getSelectAssetResvList(resvNo);
		
		if(allAssetResvList != null) {
			model.addAttribute("selectAssetResvList", allAssetResvList);
		}
		return "resv/resvAsset";
}

}
