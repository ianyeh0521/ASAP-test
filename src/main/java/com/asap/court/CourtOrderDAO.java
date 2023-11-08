package com.asap.court;

import java.util.List;

public interface CourtOrderDAO {

	void add(CourtOrder courtOrder);
	void update(CourtOrder courtOrder);
	void insert(CourtOrder courtOrder);
	void delete(int courtOrdNo);
	CourtOrder findByPK(Integer courtOrdNo);
	List<CourtOrder> getAll();
}
