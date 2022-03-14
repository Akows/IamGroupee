package com.kh.iag.mypage.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.iag.mypage.dao.myPageDao;
import com.kh.iag.ps.admin.entity.UserDto;

@Service
public class myPageServiceImpl implements myPageService {

	@Autowired
	private myPageDao dao;
	
	@Autowired
	private PasswordEncoder pe;

	@Override
	public UserDto getUser(String userNo) throws Exception {
		return dao.getUser(userNo);
	}

	@Override
	public int userUpdate(UserDto user, HttpServletRequest req) throws Exception {
		if(user.getPwd() != null && !user.getPwd().isEmpty()) {
			user.setPwd(pe.encode(user.getPwd()));
		}else {
			user.setPwd(null);
		}
		
		MultipartFile f = user.getFile();
		
//		파일 여부
		if(!f.isEmpty()) {
//			변경된 이름
			String changeName = user.getUserNo() +"_"+System.currentTimeMillis() + "_" + f.getOriginalFilename();
			String path = req.getServletContext().getRealPath("/resources/img/ps/profile/");
			File file = new File(path + changeName);
			f.transferTo(file);
			user.setProfile(changeName);
		} else {
			user.setProfile(null);
		}
		int result = dao.userUpdate(user);;
		
		return result;
	}

}
