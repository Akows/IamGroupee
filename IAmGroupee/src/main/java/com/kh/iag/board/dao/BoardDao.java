package com.kh.iag.board.dao;

import java.util.List;

import com.kh.iag.board.entity.FreeBoardDto;
import com.kh.iag.board.entity.NoticeBoardDto;
import com.kh.iag.board.entity.PageVo;

public interface BoardDao {

	int freeEnroll(FreeBoardDto freeBoardDto) throws Exception;

	int getThisBoardFreeNum(String freeTitle, String userNo) throws Exception;

	FreeBoardDto getFreeBoardDetail(int boardFreeNum) throws Exception;

	List<FreeBoardDto> getFreeBoardList(PageVo pageVoFree) throws Exception;

	int updateFreeUpdate(FreeBoardDto freeBoardDto) throws Exception;

	int freeDelete(FreeBoardDto freeBoardDto) throws Exception;

	int plusFreeViewCount(int boardFreeNum) throws Exception;

	List<FreeBoardDto> getMainFreeBoardList() throws Exception;

	List<NoticeBoardDto> getNoticeBoardList(PageVo pageVoNotice) throws Exception;

	int plusNoticeViewCount(int noticeNum) throws Exception;

	NoticeBoardDto getNoticeBoardDetail(int noticeNum) throws Exception;

	int noticeEnroll(NoticeBoardDto noticeBoardDto) throws Exception;

	int getThisBoardNoticeNum(String noticeTitle, String userNo) throws Exception;

	int updateNoticeUpdate(NoticeBoardDto noticeBoardDto) throws Exception;

	int noticeDelete(int noticeNum) throws Exception;

	List<NoticeBoardDto> getMainNoticeBoardList() throws Exception;

	int getNoticeRowCnt() throws Exception;

	int getFreeRowCnt() throws Exception;

}
