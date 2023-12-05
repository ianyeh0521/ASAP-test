package com.asap.court.service;

import java.sql.Date;
import java.util.List;

import com.asap.court.entity.CourtClosedTimeVO;

public interface CourtClosedTimeService_interface {

	int insert(CourtClosedTimeVO courtclosedtimeVO);
	
	void delete(Integer courtClosedTimeNo);
	
	// Find by courtNo
	List<CourtClosedTimeVO> findByCourtNo(Integer courtNo);
	
	Boolean existsDeter(Integer courtNo,  Date courtClosedDate, Integer courtClosedTime);
	
	List<CourtClosedTimeVO> getAll();
}
