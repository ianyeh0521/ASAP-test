package com.asap.course;

import java.util.List;

public interface CourseDAO {

	void add(Course course);
	void update(Course course);
	void insert(Course course);
	void delete(int courseNo);
	Course findByPK(Integer courseNo);
	List<Course> getAll();
}
