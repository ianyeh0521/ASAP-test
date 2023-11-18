package com.asap.course.dao;

import java.util.List;

import com.asap.course.entity.CourseVO;

public interface CourseDAO_interface {

	void updateCourse(CourseVO courseVO);
	void insertCourse(CourseVO courseVO);
	void deleteCourse(Integer courseNo);
	
	// Find course by PK
	CourseVO findByPK(Integer courseNo);
	
	// Find course by course name
	CourseVO findByName(String courseName);
	
	// Find course by coach number
	CourseVO findByCoach(String coachNo);
	
	// Find course by sport type
	CourseVO findBySportType(Integer sportTypeNo);
	
	List<CourseVO> getAll();
}
