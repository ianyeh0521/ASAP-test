package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.CourtSaveListVO;

public interface CourtSaveListDAO_interface {

	void updateSaveList(CourtSaveListVO courtSaveListVO);
	void insertSaveList(CourtSaveListVO courtSaveListVO);
	void deleteSaveList(Integer courtSaveNo);
	
	// Find savelist by PK
	CourtSaveListVO findByPK(Integer courtSaveNo);
	
	// Find savelist by member 
	CourtSaveListVO findByMember(String mbrNo);
	List<CourtSaveListVO> getAll();
}
