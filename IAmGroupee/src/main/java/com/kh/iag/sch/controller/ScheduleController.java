package com.kh.iag.sch.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.iag.sch.entity.SchDto;
import com.kh.iag.sch.service.ScheduleService;
import com.kh.iag.user.entity.UserDto;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("sch")
public class ScheduleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	private ScheduleService service;
	
	// 내 캘린더 보여주기
	@GetMapping("mySch")
	public String mySch() {
		return "sch/mySch";
	}
	
	// 캘린더 예제 페이지
	@GetMapping("schedule")
	public String schedule() {		
        return "sch/schedule";
    }
	
	// 스케줄 등록
	@PostMapping("ajax_insert_schedule")
	public int insert_schedule(@RequestParam Map<String, Object> eventData, SchDto dto) throws Exception {
		
		String st_target_data = (String) eventData.get("eventData[target_user][targetdata]");
		
		ArrayList<Map<String, String>> map_target_data = new Gson().fromJson(st_target_data, new ArrayList<Map<String, String>>().getClass());
		
		List<String> target_user_name = new ArrayList<String>();
		List<String> target_user_value = new ArrayList<String>();
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("title", eventData.get("eventData[title]"));
		map.put("description", eventData.get("eventData[description]"));
		map.put("start", eventData.get("eventData[start]"));
		map.put("end", eventData.get("eventData[end]"));
		map.put("type", eventData.get("eventData[type]"));
		map.put("backgroundColor", eventData.get("eventData[backgroundColor]"));
		map.put("allday", eventData.get("eventData[allday]"));

		int result = service.insert_schedule(map);
		
		return result;
	}
	
	// 스케줄 추가하기
//	@ResponseBody
//	@RequestMapping(value = "/addSchedule", method = RequestMethod.GET)
//	public Map<Object,Object> addSchedule(@RequestBody SchDto dto) throws Exception {
//		
//		Map<Object,Object>map = new HashMap<Object,Object>();
//
//		ScheduleService scheduleService = new ScheduleService();
//		scheduleService.addSchedule(dto);
//
//		return map;
//	}
}
