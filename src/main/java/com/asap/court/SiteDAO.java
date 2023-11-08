package com.asap.court;

import java.util.List;

public interface SiteDAO {

	void add(Site site);
	void update(Site site);
	void insert(Site site);
	void delete(int siteNo);
	Site findByPK(Integer siteNo);
	List<Site> getAll();
}
