package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.CourtVO;
import com.asap.court.entity.SiteVO;

public interface SiteDAO_interface {

	Integer insert(SiteVO siteVO);
	Integer delete(Integer siteNo);
	
	// Find site by PK
	SiteVO findByPK(Integer siteNo);
	
	// Find Courts by site(PK)
	List<CourtVO> findCourtBySite(Integer siteNo);
	
	List<SiteVO> getAll();
}
