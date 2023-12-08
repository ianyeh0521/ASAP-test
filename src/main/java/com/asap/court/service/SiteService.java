package com.asap.court.service;

import java.util.List;

import com.asap.court.dao.SiteDAO;
import com.asap.court.dao.SiteDAO_interface;
import com.asap.court.entity.SiteVO;

public class SiteService implements SiteService_interface{
	private SiteDAO_interface dao;
	
	public SiteService() {
		dao = new SiteDAO();
	}
	
	@Override
	public SiteVO add(SiteVO siteVO) {
		dao.insert(siteVO);
		return null;
	}

	@Override
	public void delete(Integer siteNo) {
		dao.delete(siteNo);		
	}

	@Override
	public SiteVO findSiteByPK(Integer SiteNo) {
		return dao.findByPK(SiteNo);
	}

	@Override
	public List<SiteVO> getAllSites() {
		return dao.getAll();
	}

}
