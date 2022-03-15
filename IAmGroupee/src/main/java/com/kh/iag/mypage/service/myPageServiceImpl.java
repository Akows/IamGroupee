package com.kh.iag.mypage.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.iag.mypage.dao.myPageDao;
import com.kh.iag.mypage.entity.addressBookDto;
import com.kh.iag.mypage.entity.updateAddress;
import com.kh.iag.ps.admin.entity.UserDto;

@Service
@Transactional
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

	@Override
	public List<addressBookDto> getAdBook(String userNo) throws Exception {
		List<addressBookDto> bookList = dao.getAdBook(userNo);
		for(addressBookDto dto : bookList) {
			List<UserDto> userList = dao.getBookUserList(dto.getAddressNo());
			dto.setUserList(userList);
		}
		return bookList;
	}

	@Override
	public List<UserDto> getAllUser() throws Exception {
		return dao.getAllUser();
	}

	@Override
	public int addBook(addressBookDto book) throws Exception {
		int result = dao.addBook(book);
		for(String user: book.getUser()) {
			dao.addBookData(user);
		}
		return result;
	}

	@Override
	public int delBook(int addressNo) throws Exception {
		dao.delBookData(addressNo);
		return dao.delBook(addressNo);
	}

	@Override
	public int bookNameModi(addressBookDto book) throws Exception {
		return dao.bookNameModi(book);
	}

	@Override
	public int bookUserModi(addressBookDto book) throws Exception {
		int result = 0;
		for(String user: book.getUser()) {
			updateAddress uBook = new updateAddress();
			uBook.setAddressNo(book.getAddressNo());
			uBook.setUser(user);
			result += dao.updateBookData(uBook);
		}
		return result;
	}



}
