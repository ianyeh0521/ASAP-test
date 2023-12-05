package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.CourtSaveListVO;

public interface CourtSaveListDAO_interface {
	
	int insert(CourtSaveListVO courtSaveListVO);
	int delete(Integer courtSaveNo);
	
	// Find savelist by PK
	CourtSaveListVO findByPK(Integer courtSaveNo);
	
	// Find savelist by member 
	List<CourtSaveListVO> findByMember(String mbrNo);
	
	List<CourtSaveListVO> getAll();
}
