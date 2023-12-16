package com.asap.court.dao;

import java.util.List;
import java.util.Map;

import com.asap.court.entity.CourtVO;

public interface CourtDAO_interface {
	
	int insert(CourtVO entity);

	int update(CourtVO entity);
	
	int delete(Integer id);
	 
	CourtVO getById(Integer id);
	
	List<CourtVO> getAll();
	
	List<CourtVO> getAllSorting(String orderBy);
	
	List<CourtVO> getByCompositeQuery(Map<String, String> map);
	
	List<CourtVO> getAll(int currentPage);
	
	List<CourtVO> getCourtsByName(String name);
	
	long getTotal();
}
