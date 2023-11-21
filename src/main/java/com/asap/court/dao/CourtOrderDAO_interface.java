package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.CourtOrderVO;

public interface CourtOrderDAO_interface{

	void updateOrder(CourtOrderVO courtOrderVO);
	void insertOrder(CourtOrderVO courtOrderVO);
	void deleteOrder(Integer courtOrdNo);
	
	// Find order by PK
	CourtOrderVO findByPK(Integer courtOrdNo);
	
	// Find order by member
	CourtOrderVO findByMember(String mbrNo);
	
	List<CourtOrderVO> getAll();
}
