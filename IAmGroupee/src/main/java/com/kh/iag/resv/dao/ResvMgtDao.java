package com.kh.iag.resv.dao;

import java.util.List;

import com.kh.iag.resv.entity.AssetDto;
import com.kh.iag.resv.entity.RoomDto;

public interface ResvMgtDao {

	List<RoomDto> getRoomList(RoomDto rDto) throws Exception;

	List<AssetDto> getAssetList(AssetDto asset) throws Exception;

}
