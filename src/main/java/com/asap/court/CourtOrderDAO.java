package com.asap.court;

import java.util.List;

public interface CourtOrderDAO {

	void add(CourtOrderVO courtOrder);
	void update(CourtOrderVO courtOrder);
	void insert(CourtOrderVO courtOrder);
	void delete(int courtOrdNo);
	CourtOrderVO findByPK(Integer courtOrdNo);
	List<CourtOrderVO> getAll();
}
