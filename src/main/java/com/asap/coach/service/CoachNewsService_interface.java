package com.asap.coach.service;

import java.util.List;

import com.asap.coach.entity.CoachNewsVO;

public interface CoachNewsService_interface {

	int add(CoachNewsVO coachNews);

	String delete(CoachNewsVO coachNews);

	List<CoachNewsVO> findByCoachNo(String coachNo);

	CoachNewsVO findByPK(String coachNewsNo);
}
