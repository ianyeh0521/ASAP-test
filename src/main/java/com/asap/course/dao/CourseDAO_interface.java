package com.asap.course.dao;

import java.util.List;
import java.util.Map;

import javax.swing.ListModel;

import com.asap.course.entity.CourseVO;

public interface CourseDAO_interface {

	int update(CourseVO courseVO);
	int insert(CourseVO courseVO);
	int delete(Integer courseNo);
	
	// Find course by PK
	CourseVO findByPK(Integer courseNo);
	
	// Find course by course name
	List<CourseVO> findByName(String courseName);
	
	// Find course by coach number
	List<CourseVO> findByCoach(String coachNo);
	
//	// Find course by sport type
//	List<CourseVO> findBySportType(Integer sportTypeNo);
	
	List<CourseVO> getByCompositeQuery(Map<String, String> map);
	
	List<CourseVO> getAll();
	
	List<CourseVO> getAll(int currentPage);
	
	long getTotal();
}
