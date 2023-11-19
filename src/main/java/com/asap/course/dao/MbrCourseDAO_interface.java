package com.asap.course.dao;

import java.util.List;

import com.asap.course.entity.MbrCourseVO;

public interface MbrCourseDAO_interface {

	void update(MbrCourseVO mbrCourseVO);
	void insert(MbrCourseVO mbrCourseVO);
	void delete(Integer mbrCourseNo);
	
	// Find mbrCourseNo by PK
	MbrCourseVO findByPK(Integer mbrCourseNo);
	
	// Find mbrCourseNo by course number
	MbrCourseVO findByCourseNo(Integer courseNo);
	
	// Find mbrCourseNo by member number
	MbrCourseVO findByMember(String mbrNo);
	
	// Find mbrCourseNo by coach number
	MbrCourseVO findByCoach(String coachNo);
	
	List<MbrCourseVO> getAll();
}
