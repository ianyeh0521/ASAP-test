package com.asap.group.service;

import java.util.List;

import com.asap.group.dao.GrpInfoDAO;
import com.asap.group.dao.GrpInfoDAO_interface;
import com.asap.group.dao.SportTypeDAO;
import com.asap.group.entity.GrpInfoVO;

public class GrpInfoService_interface implements GrpInfoService {
	private GrpInfoDAO_interface dao;

	public GrpInfoService_interface() {
		dao = new GrpInfoDAO();
		SportTypeDAO sportdao = new SportTypeDAO();
	}

	@Override
	public GrpInfoVO insert(GrpInfoVO grpInfo) {
		dao.insert(grpInfo);
		return null;
	}

	@Override
	public GrpInfoVO update(GrpInfoVO grpInfo) {
		dao.update(grpInfo);
		return null;
	}

	@Override
	public void delete(Integer grpNo) {
		dao.delete(grpNo);
	}

	@Override
	public GrpInfoVO getGrpInfoVOBygrpNo(Integer grpNo) {
		GrpInfoVO Vo =  dao.findByGrpNo(grpNo);
		return Vo;
	}
	
	

	@Override
	public List<GrpInfoVO> getByServiceFuzzySearch(String grpInfoKeyword) {
		List<GrpInfoVO> List = dao.getByFuzzySearch(grpInfoKeyword);
		return List;
		
	}

	@Override
	public List<GrpInfoVO> getALL() {
		return dao.getALL();
	}

	@Override
	public List<GrpInfoVO> getServiceQuery(String column, String Keyword) {
		return dao.getQuery(column, Keyword);
	}

}