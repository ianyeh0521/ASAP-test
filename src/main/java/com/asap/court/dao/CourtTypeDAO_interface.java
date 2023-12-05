package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.CourtTypeVO;
import com.asap.court.entity.CourtVO;

public interface CourtTypeDAO_interface {

	int update(CourtTypeVO entity);
	int delete(Integer id);
	
	// Find court type by PK
	CourtTypeVO getByPK(Integer id);
	
	// Find Courts by courtType(PK)
	List<CourtVO> findCourtByCourtType(Integer id);
	
	List<CourtTypeVO> getAll();
}
