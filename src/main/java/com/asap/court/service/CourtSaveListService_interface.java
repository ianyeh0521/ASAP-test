package com.asap.court.service;

import java.util.List;

import com.asap.court.entity.CourtSaveListVO;

public interface CourtSaveListService_interface {

	int insert(CourtSaveListVO courtSaveListVO);
	
	int delete(CourtSaveListVO courtSaveListVO);
	
	CourtSaveListVO findByPK(Integer courtSaveNo);
	
	List<CourtSaveListVO> findByMember(String mbrNo);
	
	CourtSaveListVO findByMemberAndCourtNo(String mbrNo, Integer courtNo);
	
	List<CourtSaveListVO> getAll();
}
