package com.asap.group.service;

import java.util.List;

import com.asap.group.dao.GrpInfoDAO_interface;
import com.asap.group.dao.GrpJoinInfoDAO;
import com.asap.group.dao.GrpJoinInfoDAO_interface;
import com.asap.group.entity.GrpJoinInfoVO;

public class GrpJoinInfoService_interface implements GrpJoinInfoService {
	private GrpJoinInfoDAO_interface dao;

	public GrpJoinInfoService_interface() {
		dao = new GrpJoinInfoDAO();
	}

	@Override
	public GrpJoinInfoVO insert(GrpJoinInfoVO grpJoinInfo) {
		dao.insert(grpJoinInfo);
		return null;
	}

	@Override
	public GrpJoinInfoVO update(GrpJoinInfoVO grpJoinInfo) {
		dao.update(grpJoinInfo);
		return null;
	}

	@Override
	public void delete(Integer grpJoinInfoNo) {
		dao.delete(grpJoinInfoNo);

	}

	@Override
	public GrpJoinInfoVO findByGrpJoinInfoNo(Integer grpJoinInfoNo) {
		return dao.findByGrpJoinInfoNo(grpJoinInfoNo);
	}

	@Override
	public List<GrpJoinInfoVO> getgrpjoinserviceQuery(String column, String Keyword) {

		return dao.getGrpJoinQuery(column, Keyword);
	}

	@Override
	public List<GrpJoinInfoVO> getALL() {
		return dao.getALL();
	}

}
