package com.kh.iag.resv.dao;

import java.util.List;

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
	public List<RoomDto> getRoomList(RoomDto room) throws Exception{
		return ss.selectList("resv.getRoomList", room);
	}

	@Override
	public List<AssetDto> getAssetList(AssetDto asset) throws Exception {
		return ss.selectList("resv.getAssetList", asset);
	}

}
