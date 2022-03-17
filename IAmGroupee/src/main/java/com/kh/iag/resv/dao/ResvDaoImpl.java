package com.kh.iag.resv.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.resv.entity.PageVo;
import com.kh.iag.resv.entity.ResvDto;

@Repository
public class ResvDaoImpl implements ResvDao {

	@Autowired
	private SqlSession ss;

	@Override
	public List<ResvDto> getRoomList() throws Exception {
		return ss.selectList("resv.getRoomList");
	}
	
	@Override
	public List<ResvDto> getAssetList() throws Exception {
		return ss.selectList("resv.getAssetList");
	}
	
	@Override
	public List<ResvDto> getAllRoomResvList() throws Exception {
		return ss.selectList("resv.getAllRoomResvList");
	}
	
	@Override
	public List<ResvDto> getAllAssetResvList() throws Exception {
		return ss.selectList("resv.getAllAssetResvList");
	}
	
	@Override
	public List<ResvDto> getSelectRoomResvList(int roomNo) throws Exception {
		return ss.selectList("resv.getAllRoomResvList", roomNo);
	}
	
	@Override
	public List<ResvDto> getSelectAssetResvList(int assetNo) throws Exception {
		return ss.selectList("resv.getAllAssetResvList", assetNo);
	}
	
	@Override
	public List<ResvDto> getMyResvList(String userNo, PageVo vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("userNo", userNo);
        map.put("vo", vo);
		return ss.selectList("resv.getMyResvList", map);
	}
	
	@Override
	public List<ResvDto> getMyRoomResvList(String userNo) {
		return ss.selectList("resv.getMyRoomResvList", userNo);
	}

	@Override
	public List<ResvDto> getMyAssetResvList(String userNo) {
		return ss.selectList("resv.getMyAssetResvList", userNo);
	}

	@Override
	public int insertResv(ResvDto dto) throws Exception {
		return ss.insert("resv.insertResv", dto);
	}

	@Override
	public int modResv(ResvDto dto) throws Exception {
		return ss.update("resv.modResv", dto);
	}
	
	@Override
	public int deleteResv(String[] delArr) throws Exception {
		return ss.update("resv.deleteResv", delArr);
	}

	@Override
	public int returnResv(String[] delArr) throws Exception {
		return ss.update("resv.returnResv", delArr);
	}

	@Override
	public int getResvCnt(String userNo) throws Exception {
		return ss.selectOne("resv.getResvCnt",userNo);
	}

	@Override
	public int getRoomResvNo(int roomNo) throws Exception {
		return ss.selectOne("resv.getRoomResvNo", roomNo);
	}

	@Override
	public int getAssetResvNo(int assetNo) throws Exception {
		return ss.selectOne("resv.getAssetResvNo", assetNo);
	}

	

	

	


}
