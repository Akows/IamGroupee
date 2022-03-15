package com.kh.iag.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.iag.board.entity.FreeBoardDto;
import com.kh.iag.board.service.BoardService;
import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService service;

//=======================================공지사항=======================================
	@GetMapping("notice")
	public String notice(HttpSession session) {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String boardRight = loginUser.getBoardRight();
		

		session.setAttribute("boardRight", boardRight);
		return "board/notice";
	}
//=======================================자유게시판=======================================
	@GetMapping("freeBoard")
	public String freeBoard(Model model) throws Exception {
		List<FreeBoardDto> freeBoardList = service.getFreeBoardList();
		
		model.addAttribute("freeBoardList", freeBoardList);
		return "board/freeBoard";
	}
	@GetMapping("freeWrite")
	public String freeWrite() {
		return "board/freeWrite";
	}
	
	@PostMapping("freeEnroll") // 작성한 글 디비에 저장
	public String freeEnroll(@RequestParam String freeTitle, String freeContent, HttpSession session) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String useNo = loginUser.getUserNo();
		FreeBoardDto freeBoardDto = new FreeBoardDto();
		freeBoardDto.setFreeTitle(freeTitle);
		freeBoardDto.setUserNo(useNo);
		freeBoardDto.setFreeContent(freeContent.replaceAll("\n", "").replaceAll("\t", "").replaceAll("\r", "").replaceAll("'", "&apos;"));
		// 글 등록하기
		int result = service.freeEnroll(freeBoardDto);
		// 등록한 게시글의 번호 알아오기
		int thisBoardFreeNum = service.getThisBoardFreeNum(freeTitle, useNo);
		
		return "redirect:/leave/lvInfoDetail/" + thisBoardFreeNum;
	}
	
	@GetMapping("freeBoardDetail/{boardFreeNum}") // 자유 게시글 상세보기
	public String freeBoardDetail(@PathVariable int boardFreeNum, Model model, HttpSession session) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String useNo = loginUser.getUserNo();
		
		
		FreeBoardDto freeBoardDetail = service.getFreeBoardDetail(boardFreeNum);
		// 조회수 올리기
		service.plusFreeViewCount(freeBoardDetail);
		
		session.setAttribute("useNo", useNo);
		session.setAttribute("userNo", freeBoardDetail.getUserNo());
		model.addAttribute("freeBoardDetail", freeBoardDetail);
		
		return "board/freeDetail";
	}
	
	@PostMapping("freeModify") // 작성한 글 수정하러가기
	public String lvbModify(@RequestParam int boardFreeNum, Model model) throws Exception {
		// 수정하려는 글의 데이터가져오기
		model.addAttribute("thisFreeData", service.getFreeBoardDetail(boardFreeNum));
		model.addAttribute("modify", "true");

		return "board/freeWrite";
	}
	
	@PostMapping("freeUpdate") // 수정한 글 디비에 저장
	public String freeUpdate(FreeBoardDto freeBoardDto, HttpSession session) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String useNo = loginUser.getUserNo();
		String freeTitle = freeBoardDto.getFreeTitle();
		freeBoardDto.setFreeContent(freeBoardDto.getFreeContent().replaceAll("\n", "").replaceAll("\t", "").replaceAll("\r", "").replaceAll("'", "&apos;"));
		// 수정한 글 등록하기
		int result = service.updateFreeUpdate(freeBoardDto);
		// 등록한 게시글의 번호 알아오기
		int thisBoardFreeNum = service.getThisBoardFreeNum(freeTitle, useNo);
		
		return "redirect:/board/freeBoardDetail/" + String.valueOf(thisBoardFreeNum);
	}

	@PostMapping("freeDelete") // 글 삭제
	public String freeDelete(FreeBoardDto freeBoardDto) throws Exception {
		
		int result = service.freeDelete(freeBoardDto);
		
		return "redirect:/board/freeBoard";
	}
}
