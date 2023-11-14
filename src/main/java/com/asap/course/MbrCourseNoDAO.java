package com.asap.course;

import java.util.List;

public interface MbrCourseNoDAO {

	void add(MbrCourseNoVO mbrCourseNo);
	void update(MbrCourseNoVO mbrCourseNo);
	void insert(MbrCourseNoVO mbrCourseNo);
	void delete(int mbrCourseNo);
	MbrCourseNoVO findByPK(Integer mbrCourseNo);
	List<MbrCourseNoVO> getAll();
}
