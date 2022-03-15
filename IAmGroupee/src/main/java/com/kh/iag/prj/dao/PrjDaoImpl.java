package com.kh.iag.prj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.prj.entity.PrjDto;
import com.kh.iag.resv.entity.PageVo;

@Repository
public class PrjDaoImpl implements PrjDao{
	
	@Autowired
	private SqlSession ss;

	@Override
	public int getMyPrjCnt(int departNo) throws Exception {
		return ss.selectOne("prj.getMyPrjCnt", departNo);
	}
	
	@Override
	public List<PrjDto> getPrjList(int departNo, PageVo vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("departNo", departNo);
        map.put("vo", vo);
		return ss.selectList("prj.getPrjList", map);
	}
	
	@Override
	public int createPrj(PrjDto dto) throws Exception {
		return ss.insert("prj.createPrj", dto);
	}

	@Override
	public String getUserNo(String name) throws Exception {
		return ss.selectOne("prj.getUserNo", name);
	}

	@Override
	public PrjDto viewPrj(int prjNo) throws Exception {
		return ss.selectOne("prj.viewPrj", prjNo);
	}
	
	
	
}
