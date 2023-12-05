package com.asap.court.service;


import java.sql.Date;
import java.util.List;

import com.asap.court.dao.CourtClosedTimeDAO;
import com.asap.court.dao.CourtClosedTimeDAO_interface;
import com.asap.court.entity.CourtClosedTimeVO;

public class CourtClosedTimeService implements CourtClosedTimeService_interface{

	CourtClosedTimeDAO_interface dao;
	
	public CourtClosedTimeService() {
		dao = new CourtClosedTimeDAO();
	}

	@Override
	public int insert(CourtClosedTimeVO courtclosedtimeVO) {
		return dao.insert(courtclosedtimeVO);
	}

	@Override
	public void delete(Integer courtClosedTimeNo) {
		dao.delete(courtClosedTimeNo);
	}

	@Override
	public List<CourtClosedTimeVO> findByCourtNo(Integer courtNo) {
		return dao.findByCourtNo(courtNo);
	}

	@Override
	public Boolean existsDeter(Integer courtNo, Date courtClosedDate, Integer courtClosedTime) {
		return dao.existsDeter(courtNo, courtClosedDate, courtClosedTime);
	}

	@Override
	public List<CourtClosedTimeVO> getAll() {
		return dao.getAll();
	}
	
	
}
