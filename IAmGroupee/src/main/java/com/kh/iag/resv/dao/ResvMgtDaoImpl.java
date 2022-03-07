package com.kh.iag.resv.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.resv.entity.AssetDto;
import com.kh.iag.resv.entity.RoomDto;

@Repository
public class ResvMgtDaoImpl implements ResvMgtDao {

	@Autowired
	private SqlSession ss;

	@Override
	public List<RoomDto> getRoomList(Map<String, String> filter) throws Exception {
		return ss.selectList("resv.getRoomList",filter);
	}
	
	@Override
	public List<AssetDto> getAssetList(Map<String, String> filter) throws Exception {
		return ss.selectList("resv.getAssetList",filter);
	}

	@Override
	public void insertRoom(RoomDto dto) throws Exception {
		ss.insert("resv.insertRoom",dto);
		
	}
	
	@Override
	public void insertAsset(AssetDto dto) throws Exception {
		ss.insert("resv.insertAsset",dto);
		
	}

	@Override
	public void updateRoom(RoomDto dto) throws Exception {
		ss.update("resv.updateRoom",dto);
		
	}
	
	@Override
	public void updateAsset(AssetDto dto) throws Exception {
		ss.update("resv.updateAsset",dto);
		
	}

	@Override
	public void deleteRoom(int roomNo) throws Exception {
		ss.delete("resv.deleteRoom", roomNo);
		
	}

	@Override
	public void deleteAsset(int assetNo) throws Exception {
		ss.delete("resv.deleteAsset",assetNo);
		
	}

}
