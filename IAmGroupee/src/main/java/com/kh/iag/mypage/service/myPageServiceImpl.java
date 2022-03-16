package com.kh.iag.mypage.service;

import java.io.File;
import java.util.ArrayList;
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
		int result1 = 0;
		updateAddress updateUser;
		List<updateAddress> addUserList = new ArrayList<updateAddress>();
		List<updateAddress> delUserList = new ArrayList<updateAddress>();
		int addressNo = book.getAddressNo();
		List<UserDto> userList = dao.getBookUserList(addressNo);
		for(String user: book.getUser()) {
			boolean isEquals = true;
			for(UserDto userDto : userList) {	
				if(userDto.getUserNo().equals(user)) {
					isEquals=false;
				}
			}
			if(isEquals) {
				updateUser = new updateAddress();
				updateUser.setAddressNo(addressNo);
				updateUser.setUser(user);
				addUserList.add(updateUser);
			}
		}
		
		for(UserDto userDto : userList) {	
			boolean isEquals = true;
			for(String user: book.getUser()) {
				if(userDto.getUserNo().equals(user)) {
					
					isEquals=false;
				}
			}
			if(isEquals) {
				updateUser = new updateAddress();
				updateUser.setAddressNo(addressNo);
				updateUser.setUser(userDto.getUserNo());
				delUserList.add(updateUser);
			}
		}
	
		
		for(updateAddress adduser : addUserList ) {
			result += dao.updateBookData(adduser);
		}
		
		for(updateAddress deluser : delUserList ) {
			result += dao.delBookDataUser(deluser);
		}
		
		int val = addUserList.size();
		val += delUserList.size();
		if(result == val) {
			result1 = 1;
		}else {
			result1 = 0;
		}
		
		return result1;
	}



}
