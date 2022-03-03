package com.kh.iag.attend.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.attend.dao.AttendDAO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.service.attendService;

@Controller
@RequestMapping("attend")
public class AttendManageAttachFileController 
{
	@Autowired
	private attendService service;
	
	@Autowired
	private AttendDAO Attenddao;
	
	@GetMapping("attachfile")
	public String filePage(Model model, HttpServletRequest req) throws Exception
	{ 
		String attend_mod_num = req.getParameter("attend_mod_num");
		System.out.println(attend_mod_num);
		
		List<AttendModDTO> attendModDTOList = service.getFile(attend_mod_num);
		
		model.addAttribute("file", attendModDTOList);

		return "attend/attachfile";
	}
	
	@GetMapping("attachfiledownload")
	public ResponseEntity fileDownload(String attach_file) throws IOException
	{ 
		AttendModDTO attendModDTO = Attenddao.downloadFile(attach_file);
		
		if (attendModDTO == null)
		{
			return ResponseEntity.notFound().build();
		}
		
		File file = new File("/IAmGroupee/src/main/webapp/resources/upload/files", String.valueOf(attach_file));
		
		byte[] data = FileUtils.readFileToByteArray(file);
		
		ByteArrayResource res = new ByteArrayResource(data);
		
		return ResponseEntity
			   .ok()
			   .contentType(MediaType.APPLICATION_OCTET_STREAM)
			   .header(org.springframework.http.HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + URLEncoder.encode(attendModDTO.getAttach_file(), "UTF-8") + "\"")
			   .header(org.springframework.http.HttpHeaders.CONTENT_ENCODING, "UTF-8")
			   .body(res);
	}
}