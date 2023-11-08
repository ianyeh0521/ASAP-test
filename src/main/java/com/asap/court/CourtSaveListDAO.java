package com.asap.court;

import java.util.List;

public interface CourtSaveListDAO {

	void add(CourtSaveList courtSaveList);
	void update(CourtSaveList courtSaveList);
	void insert(CourtSaveList courtSaveList);
	void delete(int courtSaveNo);
	CourtSaveList findByPK(Integer courtSaveNo);
	List<CourtSaveList> getAll();
}
