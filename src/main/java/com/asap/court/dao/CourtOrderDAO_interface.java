package com.asap.court.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

import com.asap.court.entity.CourtOrderVO;

public interface CourtOrderDAO_interface{

	int update(CourtOrderVO courtOrderVO);
	int insert(CourtOrderVO courtOrderVO);
	
	// Find order by PK
	CourtOrderVO findByPK(Integer courtOrdNo);
	
	// Find order by member
	List<CourtOrderVO> findByMember(String mbrNo);
	
	List<CourtOrderVO> findByCourtNoAndDate(Integer courtNo, Date courtOrdDate);
	
	CourtOrderVO checkOrderExistence(Integer courtNo, java.sql.Date courtOrdDate, Integer courtOrdTime, Integer courtOrdTimeEnd);
		
	List<CourtOrderVO> getAll();
	
	List<CourtOrderVO> getAllUnPaidCourt(Timestamp currentTimestamp);
}
