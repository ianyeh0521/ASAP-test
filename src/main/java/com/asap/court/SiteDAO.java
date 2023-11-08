package com.asap.court;

import java.util.List;

public interface SiteDAO {

	void add(SiteVO site);
	void update(SiteVO site);
	void insert(SiteVO site);
	void delete(int siteNo);
	SiteVO findByPK(Integer siteNo);
	List<SiteVO> getAll();
}
