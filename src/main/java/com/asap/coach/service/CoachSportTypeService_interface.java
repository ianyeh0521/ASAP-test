package com.asap.coach.service;

import java.util.List;

import com.asap.coach.entity.CoachSportTypeVO;

public interface CoachSportTypeService_interface {
	int add(CoachSportTypeVO coachSportType);

	String delete(CoachSportTypeVO coachSportType);

	CoachSportTypeVO findVo(String coachNo, int sportTypeNo);

	List<CoachSportTypeVO> findByCoachNo(String coachNo);

	List<CoachSportTypeVO> findBySportTypeNo(int sportTypeNo);
	
	String cleanByCoachNo(String coachNo);

}
