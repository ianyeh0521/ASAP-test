package com.asap.court;

import java.util.List;

public interface CourtClosedTimeDAO {

	void add(CourtClosedTimeVO courtclosedtime);
	void update(CourtClosedTimeVO courtclosedtime);
	void insert(CourtClosedTimeVO courtclosedtime);
	void delete(int courtClosedTimeNo);
	CourtClosedTimeVO findByPK(Integer courtClosedTimeNo);
	List<CourtClosedTimeVO> getAll();
}
