package com.asap.court.service;

import java.util.List;

import com.asap.court.entity.CourtTypeVO;


public interface CourtTypeService_interface {
	
	CourtTypeVO update(CourtTypeVO courtTypeVO);
	
	void delete(Integer courtTypeNo);
	
	CourtTypeVO getCourtByCourtTypeNo(Integer courtTypeNo);
	
	List<CourtTypeVO> getAllTypes();
	
	int getPageTotal();
}
