package com.asap.court.service;

import java.util.List;

import com.asap.court.entity.SiteVO;

public interface SiteService_interface {
	SiteVO add(SiteVO siteVO);
	
	void delete(Integer siteNo);
	
	SiteVO findSiteByPK(Integer SiteNo);
	
	List<SiteVO> getAllSites();

}
 