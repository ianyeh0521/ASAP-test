package com.asap.course.service;

import java.util.List;
import java.util.Map;

import com.asap.course.dao.CourseDAO;
import com.asap.course.dao.CourseDAO_interface;
import com.asap.course.entity.CourseVO;

public class CourseService implements CourseService_interface{
	CourseDAO_interface dao;
	
	public CourseService() {
		dao = new CourseDAO();
	}

	@Override
	public int insert(CourseVO courseVO) {
		return dao.insert(courseVO);
	}

	@Override
	public int update(CourseVO courseVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Integer courseNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CourseVO findByPK(Integer courseNo) {
		return dao.findByPK(courseNo);
	}

	@Override
	public List<CourseVO> findByName(String courseName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CourseVO> findByCoach(String coachNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CourseVO> getByCompositeQuery(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CourseVO> getAll() {
		return dao.getAll();
	}
	
	
}
