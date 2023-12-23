package com.asap.court.dao;

import java.sql.Date;
import java.util.List;

import com.asap.court.entity.CourtClosedTimeVO;


public interface CourtClosedTimeDAO_interface {

	int insert(CourtClosedTimeVO courtclosedtimeVO);
	int delete(Integer courtClosedTimeNo);
	
	int delete(Integer courtNo, Date courtClosedDate, Integer courtClosedTime);
	
	// delete the closed time in db where date before NOW
	int deleteBeforeNow();
	
	// Find by courtNo
	List<CourtClosedTimeVO> findByCourtNo(Integer courtNo);
	
	List<CourtClosedTimeVO> findByDate(Integer courtNo, Date courtClosedDate);
	
	Boolean existsDeter(Integer courtNo,  Date courtClosedDate, Integer courtClosedTime);
	
	List<CourtClosedTimeVO> getAll();
}
