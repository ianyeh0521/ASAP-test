package com.asap.court;

import java.util.List;

public interface CourtDAO {

	void add(CourtVO court);
	void update(CourtVO court);
	void insert(CourtVO court);
	void delete(int empno);
	CourtVO findByPK(Integer courtNo);
	List<CourtVO> getAll();
}
