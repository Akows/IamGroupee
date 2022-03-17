package com.kh.iag.prj.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kh.iag.prj.entity.CommDto;
import com.kh.iag.prj.entity.FileDto;
import com.kh.iag.prj.entity.PrjDto;
import com.kh.iag.prj.entity.PrjReportDto;
import com.kh.iag.prj.service.PrjService;
import com.kh.iag.resv.entity.PageVo;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("prj")
public class PrjController {

	@Autowired
	private PrjService service;
	
	//내프로젝트
	@GetMapping(value = {"/prjMain/{page}", "prjMain"})
	public String prjMain(HttpSession session, Model model, @PathVariable(required = false) String page, PrjReportDto dto) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		
		int departNo = (int) loginUser.getDepartmentNo();
		
		//페이징
		if(page == null) {
			return "redirect:prjMain/1";
		}
		int cntPerPage = 4; //한 페이지당 5개씩 보여주기
		int pageBtnCnt = 3;  //한번에 보여줄 페이지버튼 갯수
		int totalRow = service.getMyPrjCnt(departNo);   //DB 에 있는 모든 row 갯수
		PageVo vo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
		
		//나의 프젝 리스트 불러오기
		List<PrjDto> prjList = service.getPrjList(departNo, vo);
		if(prjList != null) {
			model.addAttribute("prjList", prjList);
			model.addAttribute("page", vo);
		}
		
		//일정불러오기
		List<PrjReportDto> eventList = service.eventList(departNo);
		model.addAttribute("eventList", eventList);
		
		return "prj/prjMain";
	}
	
	//프로젝트 생성
	@PostMapping(value = {"/prjMain/{page}", "prjMain"})
	public String createPrj(PrjDto dto, HttpServletRequest req) throws Exception {
		
		int no = Integer.parseInt(req.getParameter("departNo"));
		dto.setDepartNo(no);
    	
		String userNo = service.getUserNo(dto.getUserNo());
    	dto.setUserNo(userNo);
    	
    	System.out.println(dto);
    	int result = service.createPrj(dto);
    
        
		return "redirect:/prj/prjMain";
	}
	
	//////////////////////////////////////////////////////////////////////////////////
	
	//프로젝트 상세보기
	@GetMapping(value = {"/prjDetail/{prjNo}", "prjDetail"})
	public String prjDetail(@PathVariable int prjNo, Model model, PrjDto prj, PrjReportDto dto, CommDto comm) throws Exception {
		//프로젝트 기본정보
		PrjDto viewPrj = service.viewPrj(prjNo);
		model.addAttribute("viewPrj", viewPrj);
		
		//업무리포트 
		List<PrjReportDto> reportList = service.getReportList(prjNo);
		model.addAttribute("reportList", reportList);
		
		//글 수 카운트
		int allCnt = service.allCnt(prjNo);
		int gCnt = service.gCnt(prjNo);
		int cCnt = service.cCNt(prjNo);
		int wCnt = service.wCnt(prjNo);
		if(allCnt > 0) {
			model.addAttribute("allCnt", allCnt);
		}
		if(gCnt > 0) {
			model.addAttribute("gCnt", gCnt);
		}
		if(cCnt > 0) {
			model.addAttribute("cCnt", gCnt);
		}
		if(wCnt > 0) {
			model.addAttribute("wCnt", gCnt);
		}
		
		return "prj/prjDetail";
	}
	
	//카테고리 보기
	@GetMapping(value = "prjDetail/{prjNo}/{reportType}")
	public String selectDetail(@PathVariable int prjNo, @PathVariable(required = true) String reportType, Model model) throws Exception {
		//프로젝트 기본정보
		PrjDto viewPrj = service.viewPrj(prjNo);
		model.addAttribute("viewPrj", viewPrj);
		
		//글 수 카운트
		int allCnt = service.allCnt(prjNo);
		int gCnt = service.gCnt(prjNo);
		int cCnt = service.cCNt(prjNo);
		int wCnt = service.wCnt(prjNo);
		if(allCnt > 0) {
			model.addAttribute("allCnt", allCnt);
		}
		if(gCnt > 0) {
			model.addAttribute("gCnt", gCnt);
		}
		if(cCnt > 0) {
			model.addAttribute("cCnt", gCnt);
		}
		if(wCnt > 0) {
			model.addAttribute("wCnt", gCnt);
		}
		
		//카테고리 선택
		List<PrjReportDto> reportList = service.selectList(prjNo, reportType);
		model.addAttribute("reportList", reportList);
		
		System.out.println(prjNo);
		System.out.println(reportType);
		return "/prj/prjDetail";
	}
	
	//공지작성
	@PostMapping(value = "post")
	@ResponseBody
	public Object post(PrjReportDto dto, String reportName, String reportType, String reportContent, String userNo, int prjNo) throws Exception {
	
		dto.setReportType(reportType);
		dto.setReportName(reportName);
		dto.setReportContent(reportContent);
		dto.setUserNo(userNo);
		dto.setPrjNo(prjNo);
		
		return service.post(dto);
	}
	//일정작성
	@PostMapping(value = "postS")
	@ResponseBody
	public Object post(PrjReportDto dto, String reportName, String reportType, String reportContent, String userNo, int prjNo, String period, String location) throws Exception {
		
	
		String[] parts = dto.getPeriod().split("~");
		String start = parts[0]; 
		String end = parts[1];
    
		dto.setStartDate(start);
		dto.setEndDate(end);
		dto.setPeriod(period);
		dto.setReportType(reportType);
		dto.setReportName(reportName);
		dto.setReportContent(reportContent);
		dto.setUserNo(userNo);
		dto.setPrjNo(prjNo);
		dto.setLocation(location);
		
		return service.postS(dto);
	}
	
	//사진첨부
	@PostMapping(value="/file/{prjNo}", produces = "application/json")
    @ResponseBody
    public String uploadSummernoteImageFile(@PathVariable int prjNo,@RequestParam("file") MultipartFile multipartFile, HttpServletRequest req, FileDto dto) throws Exception {

        JsonObject jsonObject = new JsonObject();

        // 내부경로로 저장
 		String path = req.getServletContext().getRealPath("/resources/img/prj/");
 		
 		String originalFileName = multipartFile.getOriginalFilename();
 		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
 		String changeName = UUID.randomUUID() + extension;
 		
 		File targetFile = new File(path + changeName);
 		try {
 			multipartFile.transferTo(targetFile); //파일을 서버에 저장
 			
 			jsonObject.addProperty("url", "/iag/resources/img/prj/"+changeName);
 			jsonObject.addProperty("responseCode", "success");
 			
 			dto.setChangeName(changeName);
 			dto.setPrjNo(prjNo);
 			service.uploadFile(dto);
 		} catch (IOException e) {
 			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
 			jsonObject.addProperty("responseCode", "error");
 			e.printStackTrace();
 		}
 		String a = jsonObject.toString();
 		return a;
 	}
    

	//댓글 작성
	@PostMapping(value="comm")
	@ResponseBody
	public String comm(CommDto dto, Model model, String content, String userNo, int reportNo) throws Exception{
		
		dto.setContent(content);
		dto.setReportNo(reportNo);
		dto.setUserNo(userNo);
		 System.out.println(dto);
		int result = service.insertComm(dto);
		return "ok";
	}
	
	//////////////////////////////////////////////////////////////////////////////////
	
	//부서별프로젝트
	@GetMapping(value = {"/prjDept/{page}", "prjDept"})
	public String prjDept(HttpServletRequest req, Model model,@PathVariable(required = false) String page) throws Exception {
		
		//페이징
		if(page == null) {
			return "redirect:/prj/prjDept/1?departNo=1";
		}
		
		int departNo = Integer.parseInt(req.getParameter("departNo"));
		
		int cntPerPage = 4; //한 페이지당 5개씩 보여주기
		int pageBtnCnt = 3;  //한번에 보여줄 페이지버튼 갯수
		int totalRow = service.getMyPrjCnt(departNo);   //DB 에 있는 모든 row 갯수
		PageVo vo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
		
		List<PrjDto> prjList = service.getPrjList(departNo, vo);
		if(prjList != null) {
			model.addAttribute("prjList", prjList);
			model.addAttribute("page", vo);
		}
		
		//일정불러오기
		List<PrjReportDto> eventList = service.eventList(departNo);
		model.addAttribute("eventList", eventList);
		
		return "prj/prjDept";
	}
	
	
	
	
}