package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.CourtSaveListVO;

public interface CourtSaveListDAO_interface {
	
	int insert(CourtSaveListVO courtSaveListVO);
	int delete(CourtSaveListVO courtSaveListVO);
	
	// Find savelist by PK
	CourtSaveListVO findByPK(Integer courtSaveNo);
	
	// Find savelist by member 
	List<CourtSaveListVO> findByMember(String mbrNo);
	
	// Find By MemberNo And CourtNo to verify if it's in saveList
	CourtSaveListVO findByMemberAndCourtNo(String mbrNo, Integer courtNo);
	
	List<CourtSaveListVO> getAll();
}
