package com.kh.iag.resv.service;

import java.util.List;

import com.kh.iag.resv.entity.PageVo;
import com.kh.iag.resv.entity.ResvDto;

public interface ResvService {
	
	//옵션
	List<ResvDto> getRoomList() throws Exception;
	
	List<ResvDto> getAssetList() throws Exception;
	
	//전체캘린더
	List<ResvDto> getAllRoomResvList() throws Exception;
	
	List<ResvDto> getAllAssetResvList() throws Exception;
	
	//셀렉트조회
	List<ResvDto> getSelectRoomResvList(int roomNo) throws Exception;
	
	List<ResvDto> getSelectAssetResvList(int assetNo) throws Exception;

	//내예약현황
	List<ResvDto> getMyResvList(String userNo, PageVo vo) throws Exception;
	
	List<ResvDto> getMyRoomResvList(String userNo) throws Exception;
	
	List<ResvDto> getMyAssetResvList(String userNo) throws Exception;
	
	int insertResv(ResvDto dto) throws Exception;

	int deleteResv(String str) throws Exception;

	int returnResv(String str) throws Exception;

	int getResvCnt(String userNo) throws Exception;

	int modResv(ResvDto dto) throws Exception;

	int getRoomResvNo(int roomNo) throws Exception;
	
	int getAssetResvNo(int assetNo) throws Exception;


}
