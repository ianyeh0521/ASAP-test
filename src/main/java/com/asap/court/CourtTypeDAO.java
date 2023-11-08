package com.asap.court;

import java.util.List;

public interface CourtTypeDAO {

	void add(CourtTypeVO courttype);
	void update(CourtTypeVO courttype);
	void insert(CourtTypeVO courttype);
	void delete(int courtTypeNo);
	CourtTypeVO findByPK(Integer courtTypeNo);
	List<CourtTypeVO> getAll();
}
