package com.kh.iag.prj.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
import com.kh.iag.resv.entity.JsonResult;
import com.kh.iag.resv.entity.PageVo;
import com.kh.iag.resv.entity.ResvDto;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("prj")
public class PrjController {

	@Autowired
	private PrjService service;
	
	//내프로젝트
	@GetMapping(value = {"/prjMain/{page}", "prjMain"})
	public String prjMain(HttpSession session, Model model, @PathVariable(required = false) String page) throws Exception {
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
		
		return "prj/prjMain";
	}
	
	//프로젝트 생성
	@PostMapping("prjMain")
	public String createPrj(PrjDto dto) throws Exception {

		String name = dto.getUserNo();
		String userNo = service.getUserNo(name);
		dto.setUserNo(userNo);
		
		int result = service.createPrj(dto);
		
		return "prj/prjMain";
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
		
		return "prj/prjDetail";
	}
	
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
 			System.out.println(dto);
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
	@GetMapping("prjDept")
	public String prjDept() {
		
		return "prj/prjDept";
	}
	
	
	
	
}