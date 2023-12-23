package com.asap.course.service;

import java.util.List;
import java.util.Map;

import javax.swing.ListModel;

import com.asap.course.entity.CourseVO;

public interface CourseService_interface {

	int insert(CourseVO courseVO);
	
	int update(CourseVO courseVO);
	
	int delete(Integer courseNo);
	
	CourseVO findByPK(Integer courseNo);
	
	List<CourseVO> findByName(String courseName);
	
	List<CourseVO> findByCoach(String coachNo);
	
	List<CourseVO> getByCompositeQuery(Map<String, String> map);
	
	List<CourseVO> getAll();
	
	List<CourseVO> getAll(int currentPage);
	
	int getTotalPage();
}
