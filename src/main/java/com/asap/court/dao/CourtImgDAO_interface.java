package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.CourtImgVO;

public interface CourtImgDAO_interface {

	void updateImg(CourtImgVO courtimgVO);
	void insertImg(CourtImgVO courtimgVO);
	void deleteImg(Integer courtImgNo);
	
	// Find courtImg by PK
	CourtImgVO findByPK(Integer courtImgNo);
	
	// Find courtImg by court number
	CourtImgVO findByCourtNo(Integer courtNo);
	
	List<CourtImgVO> getAll();
}
