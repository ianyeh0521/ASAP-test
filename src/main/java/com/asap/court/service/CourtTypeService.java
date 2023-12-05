package com.asap.court.service;

import java.util.List;

import com.asap.court.dao.CourtTypeDAO;
import com.asap.court.dao.CourtTypeDAO_interface;
import com.asap.court.entity.CourtTypeVO;

public class CourtTypeService implements CourtTypeService_interface{
	private  CourtTypeDAO_interface dao;
	
	public CourtTypeService() {
		dao = new CourtTypeDAO();
	}


	@Override
	public CourtTypeVO update(CourtTypeVO courtTypeVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Integer courtTypeNo) {
		dao.delete(courtTypeNo);
	}

	@Override
	public CourtTypeVO getCourtByCourtTypeNo(Integer courtTypeNo) {
		return dao.getByPK(courtTypeNo);
	}

	@Override
	public List<CourtTypeVO> getAllTypes() {
		return dao.getAll();
	}

	@Override
	public int getPageTotal() {
		// TODO Auto-generated method stub
		return 0;
	}

}
