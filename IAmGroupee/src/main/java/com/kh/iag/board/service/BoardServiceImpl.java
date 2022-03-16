package com.kh.iag.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.board.dao.BoardDao;
import com.kh.iag.board.entity.FreeBoardDto;
import com.kh.iag.board.entity.NoticeBoardDto;
import com.kh.iag.board.entity.PageVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao dao;

	@Override
	public List<FreeBoardDto> getFreeBoardList(PageVo pageVoFree) throws Exception {
		return dao.getFreeBoardList(pageVoFree);
	}

	@Override // 디비에 있는 자유게시판글개수
	public int getFreeRowCnt() throws Exception {
		return dao.getFreeRowCnt();
	}
	
	@Override // 글 등록하기
	public int freeEnroll(FreeBoardDto freeBoardDto) throws Exception {
		return dao.freeEnroll(freeBoardDto);
	}

	@Override // 등록한 게시글의 번호 알아오기
	public int getThisBoardFreeNum(String freeTitle, String userNo) throws Exception {
		return dao.getThisBoardFreeNum(freeTitle,userNo);
	}

	@Override // 자유 게시글 상세보기 // 수정하려는 글 정보가져오기
	public FreeBoardDto getFreeBoardDetail(int boardFreeNum) throws Exception {
		return dao.getFreeBoardDetail(boardFreeNum);
	}

	@Override // 수정한 글 디비에 저장
	public int updateFreeUpdate(FreeBoardDto freeBoardDto) throws Exception {
		return dao.updateFreeUpdate(freeBoardDto);
	}

	@Override // 글삭제하기
	public int freeDelete(FreeBoardDto freeBoardDto) throws Exception {
		return dao.freeDelete(freeBoardDto);
	}

	@Override // 조회수 올리기
	public int plusFreeViewCount(int boardFreeNum) throws Exception {
		return dao.plusFreeViewCount(boardFreeNum);
	}

	@Override // 메인에 최신순으로 4개 가져오기
	public List<FreeBoardDto> getMainFreeBoardList() throws Exception {
		return dao.getMainFreeBoardList();
	}
/////////////////////////////////////////////////////////////////////////////////
	@Override // 공지사항목록
	public List<NoticeBoardDto> getNoticeBoardList(PageVo pageVoNotice) throws Exception {
		return dao.getNoticeBoardList(pageVoNotice);
	}

	@Override // 조회수 올리기
	public int plusNoticeViewCount(int noticeNum) throws Exception {
		return dao.plusNoticeViewCount(noticeNum);
	}
 
	@Override // 조회한 글 상세보기
	public NoticeBoardDto getNoticeBoardDetail(int noticeNum) throws Exception {
		return dao.getNoticeBoardDetail(noticeNum);
	}

	@Override // 작성한 글 저장하기
	public int noticeEnroll(NoticeBoardDto noticeBoardDto) throws Exception {
		return dao.noticeEnroll(noticeBoardDto);
	}

	@Override // 저장한 글의 번호 불러오기
	public int getThisBoardNoticeNum(String noticeTitle, String userNo) throws Exception {
		return dao.getThisBoardNoticeNum(noticeTitle, userNo);
	}

	@Override // 수정한 글 디비에 저장하기
	public int updateNoticeUpdate(NoticeBoardDto noticeBoardDto) throws Exception {
		return dao.updateNoticeUpdate(noticeBoardDto);
	}

	@Override // 글 삭제하기
	public int noticeDelete(int noticeNum) throws Exception {
		return dao.noticeDelete(noticeNum);
	}

	@Override // 메인에 최신순으로 4개 가져오기
	public List<NoticeBoardDto> getMainNoticeBoardList() throws Exception {
		return dao.getMainNoticeBoardList();
	}

	@Override // 디비에 있는 공지개수
	public int getNoticeRowCnt() throws Exception {
		return dao.getNoticeRowCnt();
	}


}
