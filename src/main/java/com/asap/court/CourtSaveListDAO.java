package com.asap.court;

import java.util.List;

public interface CourtSaveListDAO {

	void add(CourtSaveListVO courtSaveList);
	void update(CourtSaveListVO courtSaveList);
	void insert(CourtSaveListVO courtSaveList);
	void delete(int courtSaveNo);
	CourtSaveListVO findByPK(Integer courtSaveNo);
	List<CourtSaveListVO> getAll();
}
