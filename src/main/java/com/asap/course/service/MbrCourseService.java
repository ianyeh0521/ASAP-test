package com.asap.course.service;

import java.util.List;

import com.asap.course.dao.MbrCourseDAO;
import com.asap.course.dao.MbrCourseDAO_interface;
import com.asap.course.entity.MbrCourseVO;

public class MbrCourseService implements MbrCourseService_interface{
	
	MbrCourseDAO_interface dao;
	
	public MbrCourseService() {
		dao = new MbrCourseDAO();
	}

	@Override
	public int update(MbrCourseVO mbrCourseVO) {
		return dao.update(mbrCourseVO);
	}

	@Override
	public int insert(MbrCourseVO mbrCourseVO) {
		return dao.insert(mbrCourseVO);
	}

	@Override
	public int delete(Integer mbrCourseNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MbrCourseVO findByPK(Integer mbrCourseNo) {
		return dao.findByPK(mbrCourseNo);
	}

	@Override
	public List<MbrCourseVO> findByCourseNo(Integer courseNo) {
		return dao.findByCourseNo(courseNo);
	}

	@Override
	public List<MbrCourseVO> findByMember(String mbrNo) {
		return dao.findByMember(mbrNo);
	}

	@Override
	public List<MbrCourseVO> findByCoach(String coachNo) {
		return dao.findByCoach(coachNo);
	}

	@Override
	public List<MbrCourseVO> getAll() {
		return dao.getAll();
	}
	
	
	
}
