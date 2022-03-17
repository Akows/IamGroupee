package com.kh.iag.login.service;

import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.iag.login.dao.LoginDao;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override // 로그인
	public UserDto login(UserDto dto) throws Exception{
		UserDto dbUser = dao.getUserByNo(dto);
		if (passwordEncoder.matches(dto.getPwd(), dbUser.getPwd())) {
			// 세션아이디와 유효시간 DB에 저장
			return dbUser;
		} else {
			return null;
		}
	}

	@Override
	public int savedLoginCookie(String userNo, String sessionId, Date sessionLimit) throws Exception {
		return dao.savedLoginCookie(userNo, sessionId, sessionLimit);
	}

	@Override
	public UserDto checkUserBySsKey(String sessionKey) throws Exception {
		return dao.checkUserBySsKey(sessionKey);
	}

	@Override
	public UserDto getFindUser(String userNo) throws Exception {
		return dao.getFindUser(userNo);
	}

	@Override
	public void sendMail(UserDto findUser) throws Exception {
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
 
		    messageHelper.setFrom("Iamgroupe0@gmail.com"); // 보내는사람 이메일 여기선 google 메일서버 사용하는 아이디를 작성하면됨
		    messageHelper.setTo(findUser.getEmail()); // 받는사람 이메일
		    messageHelper.setSubject("[I Am Groupe] 비밀번호 변경"); // 메일제목
		    messageHelper.setText("변경된 임시 비밀번호 : " + findUser.getPwd()); // 메일 내용
 
		    mailSender.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public String changePwd(String userNo) throws Exception {
		String changePwd = getRamdomPassword();
		String encodePwd = passwordEncoder.encode(changePwd);
		UserDto user = new UserDto();
		user.setUserNo(userNo);
		user.setPwd(encodePwd);
		int result = dao.setChangePwd(user);
		if(result >0) {
			return changePwd;
		}else {
			return null;
		}
		
	}
	
	public static String getRamdomPassword() { 
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', 
				'7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
				'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' }; 
		int idx = 0; 
		StringBuffer sb = new StringBuffer(); 
		for (int i = 0; i < 10; i++) { 
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]); 
		} 
		System.out.println(sb.toString());
		return sb.toString(); 
	}

	
}
