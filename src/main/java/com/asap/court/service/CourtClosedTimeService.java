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
	public int delete(Integer courtNo, Date courtClosedDate, Integer courtClosedTime) {
		return dao.delete(courtNo, courtClosedDate, courtClosedTime);
	}

	@Override
	public List<CourtClosedTimeVO> findByCourtNo(Integer courtNo) {
		// 把今天以前的不開放資料刪除
		dao.deleteBeforeNow();
		return dao.findByCourtNo(courtNo);
	}

	@Override
	public Boolean existsDeter(Integer courtNo, Date courtClosedDate, Integer courtClosedTime) {
		return dao.existsDeter(courtNo, courtClosedDate, courtClosedTime);
	}

	@Override
	public List<CourtClosedTimeVO> getAll() {
		dao.deleteBeforeNow();
		return dao.getAll();
	}

	@Override
	public List<CourtClosedTimeVO> findByDate(Integer courtNo, Date courtClosedDate) {
		return dao.findByDate(courtNo, courtClosedDate);
	}
	
	
	
	
}
