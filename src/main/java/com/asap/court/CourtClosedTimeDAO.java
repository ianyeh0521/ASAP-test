package com.asap.court;

import java.util.List;

public interface CourtClosedTimeDAO {

	void add(CourtClosedTime courtclosedtime);
	void update(CourtClosedTime courtclosedtime);
	void insert(CourtClosedTime courtclosedtime);
	void delete(int courtClosedTimeNo);
	CourtClosedTime findByPK(Integer courtClosedTimeNo);
	List<CourtClosedTime> getAll();
}
