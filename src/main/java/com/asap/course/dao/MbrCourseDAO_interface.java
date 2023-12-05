package com.asap.course.dao;

import java.util.List;

import com.asap.course.entity.MbrCourseVO;

public interface MbrCourseDAO_interface {

	int update(MbrCourseVO mbrCourseVO);
	int insert(MbrCourseVO mbrCourseVO);
	int delete(Integer mbrCourseNo);
	
	// Find mbrCourseNo by PK
	MbrCourseVO findByPK(Integer mbrCourseNo);
	
	// Find mbrCourseNo by course number
	List<MbrCourseVO> findByCourseNo(Integer courseNo);
	
	// Find mbrCourseNo by member number
	List<MbrCourseVO> findByMember(String mbrNo);
	
	// Find mbrCourseNo by coach number
	List<MbrCourseVO> findByCoach(String coachNo);
	
	List<MbrCourseVO> getAll();
}
