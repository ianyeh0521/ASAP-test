package com.asap.course;

import java.util.List;

public interface CourseDAO {

	void add(CourseVO course);
	void update(CourseVO course);
	void insert(CourseVO course);
	void delete(int courseNo);
	CourseVO findByPK(Integer courseNo);
	List<CourseVO> getAll();
}
