package com.asap.court.service;

import java.util.List;

import com.asap.court.dao.CourtImgDAO;
import com.asap.court.dao.CourtImgDAO_interface;
import com.asap.court.entity.CourtImgVO;

public class CourtImgService implements CourtImgService_interface{
	CourtImgDAO_interface dao;
	
	public CourtImgService() {
		dao = new CourtImgDAO();
	}
	
	@Override
	public int insert(CourtImgVO courtimgVO) {
		return dao.insert(courtimgVO);
	}

	@Override
	public void delete(Integer courtImgNo) {
		dao.delete(courtImgNo);
		
	}

	@Override
	public CourtImgVO findByPK(Integer courtImgNo) {
		return dao.findByPK(courtImgNo);
	}

	@Override
	public List<CourtImgVO> findByCourtNo(Integer courtNo) {
		return dao.findByCourtNo(courtNo);
	}

	@Override
	public List<CourtImgVO> getAll() {
		return dao.getAll();
	}

	
}
