package com.kh.iag.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/board")
public class AdminBoardController {

	
	@GetMapping("noticeWriteAD") // 휴무 정보 게시글 작성 페이지
	public String noticeWriteAD() {
		return "board/admin/noticeWriteAD";
	}
}
