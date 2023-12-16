package com.asap.coach.service;

import java.util.List;

import com.asap.coach.dao.CoachNewsDAO;
import com.asap.coach.dao.CoachNewsDAO_interface;
import com.asap.coach.entity.CoachNewsVO;

public class CoachNewsService implements CoachNewsService_interface{
	
	private CoachNewsDAO_interface dao;
	
	public CoachNewsService() {
		dao = new CoachNewsDAO();
	}

	@Override
	public int add(CoachNewsVO coachNews) {
	
		return dao.add(coachNews);
	}

	@Override
	public String delete(CoachNewsVO coachNews) {
		
		return dao.delete(coachNews);
	}

	@Override
	public List<CoachNewsVO> findByCoachNo(String coachNo) {
		
		return dao.findByCoachNo(coachNo);
	}

	@Override
	public CoachNewsVO findByPK(String coachNewsNo) {
		
		return dao.findByPK(coachNewsNo);
	}

	
}
