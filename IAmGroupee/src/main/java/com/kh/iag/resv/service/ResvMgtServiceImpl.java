package com.kh.iag.resv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.resv.dao.ResvMgtDao;
import com.kh.iag.resv.entity.AssetDto;
import com.kh.iag.resv.entity.RoomDto;

@Service
public class ResvMgtServiceImpl implements ResvMgtService {

	@Autowired
	private ResvMgtDao dao;
	
	@Override
	public List<RoomDto> getRoomList(RoomDto room) throws Exception{
		return dao.getRoomList(room);
	}

	@Override
	public List<AssetDto> getAssetList(AssetDto asset) throws Exception {
		return dao.getAssetList(asset);
	}

}
