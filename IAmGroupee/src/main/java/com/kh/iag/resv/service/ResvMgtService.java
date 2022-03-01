package com.kh.iag.resv.service;

import java.util.List;

import com.kh.iag.resv.entity.AssetDto;
import com.kh.iag.resv.entity.RoomDto;

public interface ResvMgtService {

	List<RoomDto> getRoomList(RoomDto room) throws Exception;

	List<AssetDto> getAssetList(AssetDto asset) throws Exception;
	

}
