package com.asap.course.service;

import java.util.List;
import java.util.Map;

import com.asap.course.dao.CourseDAO;
import com.asap.course.dao.CourseDAO_interface;
import com.asap.course.entity.CourseVO;

public class CourseService implements CourseService_interface{
	private static final long PAGE_MAX_RESULT = 5;
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
		return dao.update(courseVO);
	}

	@Override
	public int delete(Integer courseNo) {
		return dao.delete(courseNo);
	}

	@Override
	public CourseVO findByPK(Integer courseNo) {
		return dao.findByPK(courseNo);
	}

	@Override
	public List<CourseVO> findByName(String courseName) {
		return dao.findByName(courseName);
	}

	@Override
	public List<CourseVO> findByCoach(String coachNo) {
		return dao.findByCoach(coachNo);
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

	@Override
	public List<CourseVO> getAll(int currentPage) {
		return dao.getAll(currentPage);
	}

	@Override
	public int getTotalPage() {
		long total = dao.getTotal();
		int pageQty = (int)(total % PAGE_MAX_RESULT == 0 ? (total / PAGE_MAX_RESULT) : (total / PAGE_MAX_RESULT + 1));
		return pageQty;
	}
	
	
}
