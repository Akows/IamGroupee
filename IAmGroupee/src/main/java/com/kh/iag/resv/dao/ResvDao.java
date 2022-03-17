package com.kh.iag.resv.dao;

import java.util.List;

import com.kh.iag.resv.entity.PageVo;
import com.kh.iag.resv.entity.ResvDto;

public interface ResvDao {

	List<ResvDto> getRoomList() throws Exception;
	
	List<ResvDto> getAssetList() throws Exception;
	
	List<ResvDto> getAllRoomResvList() throws Exception;
	
	List<ResvDto> getAllAssetResvList() throws Exception;
	
	List<ResvDto> getSelectRoomResvList(int roomNo) throws Exception;
	
	List<ResvDto> getSelectAssetResvList(int assetNo) throws Exception;
	
	List<ResvDto> getMyResvList(String userNo, PageVo vo) throws Exception;
	
	List<ResvDto> getMyRoomResvList(String userNo);

	List<ResvDto> getMyAssetResvList(String userNo);
	
	int insertResv(ResvDto dto) throws Exception;

	int modResv(ResvDto dto) throws Exception;
	
	int deleteResv(String[] delArr) throws Exception;

	int returnResv(String[] delArr) throws Exception;

	int getResvCnt(String userNo) throws Exception;

	int getRoomResvNo(int roomNo) throws Exception;;

	int getAssetResvNo(int assetNo) throws Exception;;

	

	

}
