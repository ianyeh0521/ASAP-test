package com.asap.court.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import com.asap.court.entity.CourtOrderVO;

public interface CourtOrderService_interface {

	int update(CourtOrderVO courtOrderVO);
	
	int insert(CourtOrderVO courtOrderVO);
	
	CourtOrderVO findByPK(Integer courtOrdNo);
	
	List<CourtOrderVO> findByMember(String mbrNo);
	
	Boolean checkOrder(Integer courtNo, java.sql.Date courtOrdDate, Integer courtOrdTime, Integer courtOrdTimeEnd);
	
	Boolean checkOrderDateAndTime(Integer courtNo, java.sql.Date courtOrdDate, Integer courtOrdTime, Integer courtOrdTimeEnd);
	
	List<CourtOrderVO> getAll();
	
	List<CourtOrderVO> getAllUnPaidCourt(Date currentDateAsDate);
}
