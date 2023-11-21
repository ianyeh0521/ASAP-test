package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.CourtClosedTimeVO;

public interface CourtClosedTimeDAO_interface {

	void updateTime(CourtClosedTimeVO courtclosedtimeVO);
	void insertTime(CourtClosedTimeVO courtclosedtimeVO);
	void deleteTime(Integer courtClosedTimeNo);
	
	// Find by PK
	CourtClosedTimeVO findByPK(Integer courtClosedTimeNo);
	
	// Find by court number
	CourtClosedTimeVO findByCourtNo(Integer courtNo);
	
	List<CourtClosedTimeVO> getAll();
}
