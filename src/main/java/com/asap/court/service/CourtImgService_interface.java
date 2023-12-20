package com.asap.court.service;

import java.util.List;

import com.asap.court.entity.CourtImgVO;
import com.asap.court.entity.CourtVO;

public interface CourtImgService_interface {

	int insert(CourtImgVO courtimgVO);
	
	void delete(Integer courtImgNo);
	
	CourtImgVO findByPK(Integer courtImgNo);
	
	List<CourtImgVO> findByCourtNo(Integer courtNo);
	
	List<CourtImgVO> getAll();
	
	List<CourtImgVO> getAll(int startIndex, int pageSize);

}
