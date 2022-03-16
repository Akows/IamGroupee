package com.kh.iag.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.iag.board.entity.NoticeBoardDto;
import com.kh.iag.board.service.BoardService;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("admin/board")
public class AdminBoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("noticeWriteAD") // 휴무 정보 게시글 작성 페이지
	public String noticeWriteAD() {
		return "board/admin/noticeWriteAD";
	}
	
	@PostMapping("noticeEnroll") // 작성한 글 디비에 저장
	public String noticeEnroll(@RequestParam String noticeTitle, String noticeContent, HttpSession session) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		NoticeBoardDto noticeBoardDto = new NoticeBoardDto();
		noticeBoardDto.setNoticeTitle(noticeTitle);
		noticeBoardDto.setUserNo(userNo);
		noticeBoardDto.setNoticeContent(noticeContent.replaceAll("\n", "").replaceAll("\t", "").replaceAll("\r", "").replaceAll("'", "&apos;"));
		// 글 등록하기
		int result = service.noticeEnroll(noticeBoardDto);
		// 등록한 게시글의 번호 알아오기
		int thisBoardNoticeNum = service.getThisBoardNoticeNum(noticeTitle, userNo);
		
		return "redirect:/board/noticeBoardDetail/" + thisBoardNoticeNum;
	}

	
	@PostMapping("noticeModify") // 작성한 글 수정하러가기
	public String noticeModify(@RequestParam int noticeNum, Model model) throws Exception {
		// 수정하려는 글의 데이터가져오기
		model.addAttribute("thisNoticeData", service.getNoticeBoardDetail(noticeNum));
		model.addAttribute("modify", "true");

		return "board/admin/noticeWriteAD";
	}
	
	@PostMapping("noticeUpdate") // 수정한 글 디비에 저장
	public String noticeUpdate(NoticeBoardDto noticeBoardDto, HttpSession session) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String useNo = loginUser.getUserNo();
		String noticeTitle = noticeBoardDto.getNoticeTitle();
		noticeBoardDto.setUserNo(useNo);
		noticeBoardDto.setNoticeContent(noticeBoardDto.getNoticeContent().replaceAll("\n", "").replaceAll("\t", "").replaceAll("\r", "").replaceAll("'", "&apos;"));
		// 수정한 글 등록하기
		int result = service.updateNoticeUpdate(noticeBoardDto);
		// 등록한 게시글의 번호 알아오기
		int thisBoardNoticeNum = service.getThisBoardNoticeNum(noticeTitle, useNo);
		
		return "redirect:/board/noticeBoardDetail/" + String.valueOf(thisBoardNoticeNum);
	}

	@PostMapping("noticeDelete") // 글 삭제
	public String noticeDelete(NoticeBoardDto noticeBoardDto) throws Exception {
		int noticeNum = noticeBoardDto.getNoticeNum();
		int result = service.noticeDelete(noticeNum);
		
		return "redirect:/board/notice";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
