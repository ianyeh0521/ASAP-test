package com.asap.course.service;

import java.util.List;

import com.asap.course.entity.MbrCourseVO;

public interface MbrCourseService_interface {

	int update(MbrCourseVO mbrCourseVO);
	
	int insert(MbrCourseVO mbrCourseVO);
	
	int delete(Integer mbrCourseNo);
	
	MbrCourseVO findByPK(Integer mbrCourseNo);
	
	List<MbrCourseVO> findByCourseNo(Integer courseNo);
	
	List<MbrCourseVO> findByMember(String mbrNo);
	
	List<MbrCourseVO> findByCoach(String coachNo);
	
	List<MbrCourseVO> getAll();
	
	List<MbrCourseVO> mbrCheckOrd(String mbrNo, Integer courseNo);
}
