package com.asap.court;

import java.util.List;

public interface CourtTypeDAO {

	void add(CourtType courttype);
	void update(CourtType courttype);
	void insert(CourtType courttype);
	void delete(int courtTypeNo);
	CourtType findByPK(Integer courtTypeNo);
	List<CourtType> getAll();
}
