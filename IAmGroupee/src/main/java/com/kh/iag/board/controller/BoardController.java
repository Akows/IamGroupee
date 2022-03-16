package com.kh.iag.board.controller;

import java.util.List;

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
import com.kh.iag.board.entity.NoticeBoardDto;
import com.kh.iag.board.service.BoardService;
import com.kh.iag.board.entity.PageVo;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService service;

//=======================================공지사항=======================================
	@GetMapping(value = {"notice/{page}","notice"}) // 공지사항 목록
	public String notice(HttpSession session, Model model, @PathVariable(required = false) String page) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String boardRight = loginUser.getBoardRight();
		if (page == null) {
			return "redirect:notice/1";
		}

		//페이지vo생성 int currentPage, int cntPerPage, int pageBtnCnt, int totalRow
		int cntPerPage = 8; // 한 페이지 당 8개씩 보여주기
		int pageBtnCnt = 3; // 한 번에 보여줄 버튼 개수
		int totalNoticeRow = service.getNoticeRowCnt(); // 디비에 있는 모든 연차사용내역 데이터개수
		PageVo pageVoNotice = new PageVo(page, cntPerPage, pageBtnCnt, totalNoticeRow);
		List<NoticeBoardDto> noticeBoardList = service.getNoticeBoardList(pageVoNotice);
		

		model.addAttribute("noticeBoardList", noticeBoardList);
		model.addAttribute("page", pageVoNotice);
		session.setAttribute("boardRight", boardRight);
		return "board/notice";
	}

	@GetMapping("noticeBoardDetail/{noticeNum}") // 공지사항 상세보기
	public String noticeBoardDetail(@PathVariable int noticeNum, Model model, HttpSession session) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String boardRight = loginUser.getBoardRight();
		
		// 조회수 올리기
		service.plusNoticeViewCount(noticeNum);
		
		NoticeBoardDto noticeBoardDetail = service.getNoticeBoardDetail(noticeNum);
		
		session.setAttribute("boardRight", boardRight);
		model.addAttribute("noticeBoardDetail", noticeBoardDetail);
		
		return "board/noticeDetail";
	}
//=======================================자유게시판=======================================
	@GetMapping(value = {"freeBoard/{page}","freeBoard"}) // 자유게시판 목록 보여주기
	public String freeBoard(Model model, @PathVariable(required = false) String page) throws Exception {
		if (page == null) {
			return "redirect:freeBoard/1";
		}
		//페이지vo생성 int currentPage, int cntPerPage, int pageBtnCnt, int totalRow
		int cntPerPage = 8; // 한 페이지 당 8개씩 보여주기
		int pageBtnCnt = 3; // 한 번에 보여줄 버튼 개수
		int totalNoticeRow = service.getFreeRowCnt(); // 디비에 있는 모든 연차사용내역 데이터개수
		PageVo pageVoFree = new PageVo(page, cntPerPage, pageBtnCnt, totalNoticeRow);
		List<FreeBoardDto> freeBoardList = service.getFreeBoardList(pageVoFree);
		
		model.addAttribute("freeBoardList", freeBoardList);
		model.addAttribute("page", pageVoFree);
		return "board/freeBoard";
	}
	@GetMapping("freeWrite") // 글작성 페이지
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
		
		return "redirect:/board/freeBoardDetail/" + thisBoardFreeNum;
	}
	
	@GetMapping("freeBoardDetail/{boardFreeNum}") // 자유 게시글 상세보기
	public String freeBoardDetail(@PathVariable int boardFreeNum, Model model, HttpSession session) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String useNo = loginUser.getUserNo();
		
		// 조회수 올리기
		service.plusFreeViewCount(boardFreeNum);
		
		FreeBoardDto freeBoardDetail = service.getFreeBoardDetail(boardFreeNum);
		
		session.setAttribute("useNo", useNo);
		session.setAttribute("userNo", freeBoardDetail.getUserNo());
		model.addAttribute("freeBoardDetail", freeBoardDetail);
		
		return "board/freeDetail";
	}
	
	@PostMapping("freeModify") // 작성한 글 수정하러가기
	public String freeModify(@RequestParam int boardFreeNum, Model model) throws Exception {
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
		freeBoardDto.setFreeTitle(freeBoardDto.getFreeTitle());
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
