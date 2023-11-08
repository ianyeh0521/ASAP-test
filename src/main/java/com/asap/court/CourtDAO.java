package com.asap.court;

import java.util.List;

public interface CourtDAO {

	void add(Court court);
	void update(Court court);
	void insert(Court court);
	void delete(int empno);
	Court findByPK(Integer courtNo);
	List<Court> getAll();
}
