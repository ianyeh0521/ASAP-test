package com.asap.court.dao;

import java.util.List;

import com.asap.court.entity.SiteVO;

public interface SiteDAO_interface {

	void updateSite(SiteVO siteVO);
	void insertSite(SiteVO siteVO);
	void deleteSite(Integer siteNo);
	
	// Find site by PK
	SiteVO findByPK(Integer siteNo);
	
	List<SiteVO> getAll();
}
