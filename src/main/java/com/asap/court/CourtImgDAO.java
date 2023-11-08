package com.asap.court;

import java.util.List;

public interface CourtImgDAO {

	void add(CourtImg courtimg);
	void update(CourtImg courtimg);
	void insert(CourtImg courtimg);
	void delete(int courtImgNo);
	CourtImg findByPK(Integer courtImgNo);
	List<CourtImg> getAll();
}
