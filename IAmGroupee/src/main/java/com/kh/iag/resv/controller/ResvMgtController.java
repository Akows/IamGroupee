package com.kh.iag.resv.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iag.resv.entity.AssetDto;
import com.kh.iag.resv.entity.JsonResult;
import com.kh.iag.resv.entity.RoomDto;
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
	@ResponseBody
	@GetMapping(value = "/room", produces = "application/json")
    public Object rList(Model model, @RequestParam Map<String , String> filter) throws Exception {
		
		JsonResult result =  new JsonResult();
		try{
			result.setStatus("ok");
			result.setData(service.getRoomList(filter));
		}catch(Exception e){
			    e.printStackTrace();
		}finally{
			return result;
		}
    }
	
	//비품 리스트 보여주기
	@ResponseBody
    @GetMapping(value = "/asset", produces = "application/json")
    public Object aList(Model model, @RequestParam Map<String , String> filter) throws Exception {
		
		JsonResult result =  new JsonResult();
		
		try{
			result.setStatus("ok");
			result.setData(service.getAssetList(filter));
		}catch(Exception e){
			    e.printStackTrace();
		}finally{
			return result;
		}
    }

	//자산 추가
	@ResponseBody
    @RequestMapping(value = "/room", produces = "application/json", method = RequestMethod.POST)
    public Object rInsert(Model model, @RequestBody RoomDto dto) throws Exception {
		JsonResult result =  new JsonResult();

		if(dto.getActivateYn() == "true") {
			dto.setActivateYn("Y");	
			dto.setReserved("N");
		}else {
			dto.setActivateYn("N");
			dto.setReserved("N");
		}

		System.out.println(dto);
		try{
			service.insertRoom(dto);
			result.setStatus("ok");
		}catch(Exception e){
			    e.printStackTrace();
		}finally{
			return result;
		}
    }
	@ResponseBody
    @PostMapping(value = "/asset", produces = "application/json")
    public Object aInsert(Model model, @RequestBody AssetDto dto) throws Exception {
		JsonResult result =  new JsonResult();
		
		if(dto.getActivateYn() == "true") {
			dto.setActivateYn("Y");	
			dto.setReserved("N");
		}else {
			dto.setActivateYn("N");
			dto.setReserved("N");
		}
		
		try{
			service.insertAsset(dto);
			result.setStatus("ok");
		}catch(Exception e){
			    e.printStackTrace();
		}finally{
			return result;
		}
    }
	
	//자산 수정
	@ResponseBody
    @PostMapping(value = "room/{roomNo}", produces = "application/json")
    public Object rUpdate(Model model, @PathVariable int roomNo, @RequestBody RoomDto dto) throws Exception {
		JsonResult result =  new JsonResult();
		
		if(dto.getActivateYn() == "true") {
			dto.setActivateYn("Y");	
			dto.setReserved("N");
		}else {
			dto.setActivateYn("N");
			dto.setReserved("N");
		}
		
		try{
			service.updateRoom(dto);
			result.setStatus("ok");
		}catch(Exception e){
			    e.printStackTrace();
		}finally{
			return result;
		}
    }
	@ResponseBody
    @PostMapping(value = "asset/{assetNo}", produces = "application/json")
    public Object aUpdate(Model model, @PathVariable int assetNo, @RequestBody AssetDto dto) throws Exception {
		JsonResult result =  new JsonResult();
		
		if(dto.getActivateYn() == "true") {
			dto.setActivateYn("Y");	
			dto.setReserved("N");
		}else {
			dto.setActivateYn("N");
			dto.setReserved("N");
		}
		
		try{
			service.updateAsset(dto);
			result.setStatus("ok");
		}catch(Exception e){
			    e.printStackTrace();
		}finally{
			return result;
		}
    }

	//자산삭제
	@ResponseBody
    @PutMapping(value = "room/{roomNo}", produces = "application/json")
    public Object rDelete(Model model, @PathVariable int roomNo) throws Exception {
		JsonResult result =  new JsonResult();
		
		try{
			service.deleteRoom(roomNo);
			System.out.println(roomNo);
			result.setStatus("ok");
		}catch(Exception e){
			    e.printStackTrace();
		}finally{
			return result;
		}
    }
	
	@ResponseBody
    @PutMapping(value = "asset/{assetNo}", produces = "application/json")
    public Object aDelete(Model model, @PathVariable int assetNo) throws Exception {
		JsonResult result =  new JsonResult();
		
		try{
			service.deleteAsset(assetNo);
			result.setStatus("ok");
		}catch(Exception e){
			    e.printStackTrace();
		}finally{
			return result;
		}
    }
	
}
