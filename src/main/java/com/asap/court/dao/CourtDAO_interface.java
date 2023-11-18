package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.CourtVO;

public interface CourtDAO_interface {

	void updateCourt(CourtVO courtVO);
	void insertCourt(CourtVO courtVO);
	void deleteCourt(Integer courtNo);
	
	// Find court by PK
	CourtVO findByPK(Integer courtNo);
	
	// Find court by court name
	CourtVO findByCourtName(String courtName);
	
	// Find court by address
	CourtVO findByAddress(String courtAddress);
	
	// Find court by site
	CourtVO findBySite(Integer siteNo);
	
	List<CourtVO> getAll();
}
