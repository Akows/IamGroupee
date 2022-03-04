package com.kh.iag.attend.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.aspectj.util.FileUtil;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@Autowired
	ResourceLoader resourceLoader;

	@Value("${file.path}") 
	private String file_Path;

	@GetMapping("attachfile")
	public String attachfile(Model model, HttpServletRequest req) throws Exception
	{ 
		String attend_mod_num = req.getParameter("attend_mod_num");
		
		List<AttendModDTO> attendModDTOList = service.getFile(attend_mod_num);
		
		model.addAttribute("file", attendModDTOList);

		return "attend/attachfile";
	}

	@GetMapping("attachfiledownload/{attach_file}")
	public ResponseEntity fileDownload(@PathVariable String attach_file) throws IOException
	{ 
		AttendModDTO attendModDTO = Attenddao.downloadFile(attach_file);
		
		if (attendModDTO == null)
		{
			return ResponseEntity.notFound().build();
		}
		
		File file = new File("D://Coding Archive//Git Repo//FinalProject//FinalPrj//IAmGroupee//src//main//webapp//resources//upload//files", String.valueOf(attach_file));
		
		byte[] data = FileUtils.readFileToByteArray(file);
		
		ByteArrayResource res = new ByteArrayResource(data);
		
		return ResponseEntity
			   .ok()
			   .contentType(MediaType.APPLICATION_OCTET_STREAM)
			   .contentLength(attendModDTO.getAttach_file_size())
			   .header(org.springframework.http.HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + URLEncoder.encode(attendModDTO.getAttach_file(), "UTF-8") + "\"")
			   .header(org.springframework.http.HttpHeaders.CONTENT_ENCODING, "UTF-8")
			   .body(res);
	}
	
}