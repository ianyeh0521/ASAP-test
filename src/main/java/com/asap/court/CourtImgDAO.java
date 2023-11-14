package com.asap.court;

import java.util.List;

public interface CourtImgDAO {

	void add(CourtImgVO courtimg);
	void update(CourtImgVO courtimg);
	void insert(CourtImgVO courtimg);
	void delete(int courtImgNo);
	CourtImgVO findByPK(Integer courtImgNo);
	List<CourtImgVO> getAll();
}
