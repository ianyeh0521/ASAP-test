package com.asap.court.service;

import java.util.List;
import java.util.Map;

import com.asap.court.entity.CourtVO;

public interface CourtService_interface {
	int add(CourtVO courtVO);
	
	CourtVO update(CourtVO courtVO);
	
	void delete(Integer courtNo);
	
	CourtVO getCourtByCourtNo(Integer courtNo);
	
	List<CourtVO> getAllCourts(int currentPage);
	
	List<CourtVO> getAllCourts();
	
	List<CourtVO> getCourtsByCourtName(String name);
	
	int getPageTotal();
	
	List<CourtVO> getCourtsByCompositeQuery(Map<String, String[]> map);
}
