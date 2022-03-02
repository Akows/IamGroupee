package com.kh.iag.resv.dao;

import java.util.List;
import java.util.Map;

import com.kh.iag.resv.entity.AssetDto;
import com.kh.iag.resv.entity.RoomDto;

public interface ResvMgtDao {

	List<RoomDto> getRoomList(Map<String, String> filter) throws Exception;

	void insertRoom(RoomDto dto) throws Exception;
	
	void updateRoom(RoomDto dto) throws Exception;
	
	void deleteRoom(int roomNo) throws Exception;
	
	List<AssetDto> getAssetList(Map<String, String> filter) throws Exception;

	void insertAsset(AssetDto dto) throws Exception;
	
	void updateAsset(AssetDto dto) throws Exception;
	
	void deleteAsset(int assetNo) throws Exception;

}
