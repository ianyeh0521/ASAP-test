package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.CourtOrderVO;

public interface CourtOrderDAO_interface{

	int update(CourtOrderVO courtOrderVO);
	int insert(CourtOrderVO courtOrderVO);
	
	// Find order by PK
	CourtOrderVO findByPK(Integer courtOrdNo);
	
	// Find order by member
	List<CourtOrderVO> findByMember(String mbrNo);
	
	List<CourtOrderVO> getAll();
}
