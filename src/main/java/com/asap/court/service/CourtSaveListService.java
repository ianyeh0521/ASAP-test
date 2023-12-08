package com.asap.court.service;

import java.util.List;

import com.asap.court.dao.CourtSaveListDAO;
import com.asap.court.dao.CourtSaveListDAO_interface;
import com.asap.court.entity.CourtSaveListVO;

public class CourtSaveListService implements CourtSaveListService_interface{

	private CourtSaveListDAO_interface dao;
	
	public CourtSaveListService() {
		dao = new CourtSaveListDAO();
	}

	@Override
	public int insert(CourtSaveListVO courtSaveListVO) {
		return dao.insert(courtSaveListVO);
	}

	@Override
	public int delete(CourtSaveListVO courtSaveListVO) {
		return dao.delete(courtSaveListVO);
	}

	@Override
	public CourtSaveListVO findByPK(Integer courtSaveNo) {
		return dao.findByPK(courtSaveNo);
	}

	@Override
	public List<CourtSaveListVO> findByMember(String mbrNo) {
		return dao.findByMember(mbrNo);
	}

	@Override
	public CourtSaveListVO findByMemberAndCourtNo(String mbrNo, Integer courtNo) {
		return dao.findByMemberAndCourtNo(mbrNo, courtNo);
	}

	@Override
	public List<CourtSaveListVO> getAll() {
		return dao.getAll();
	}
	
	
}
