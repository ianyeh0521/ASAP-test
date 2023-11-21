package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.CourtTypeVO;

public interface CourtTypeDAO_interface {

	void updateCourtType(CourtTypeVO courtTypeVO);
	void insertCourtType(CourtTypeVO courtTypeVO);
	void deleteCourtType(Integer courtTypeNo);
	
	// Find court type by PK
	CourtTypeVO findByPK(Integer courtTypeNo);
	
	List<CourtTypeVO> getAll();
}
