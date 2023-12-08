package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.CourtImgVO;

public interface CourtImgDAO_interface {

	int insert(CourtImgVO courtimgVO);
	int delete(Integer courtImgNo);
	
	// Find courtImg by PK
	CourtImgVO findByPK(Integer courtImgNo);
	
	// Find courtImg by courtNo
	List<CourtImgVO> findByCourtNo(Integer courtNo);
	
	List<CourtImgVO> getAll();
}
