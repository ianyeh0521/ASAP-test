package com.asap.course;

import java.util.List;

public interface MbrCourseNoDAO {

	void add(MbrCourseNo mbrCourseNo);
	void update(MbrCourseNo mbrCourseNo);
	void insert(MbrCourseNo mbrCourseNo);
	void delete(int mbrCourseNo);
	MbrCourseNo findByPK(Integer mbrCourseNo);
	List<MbrCourseNo> getAll();
}
