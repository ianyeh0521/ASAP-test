package com.asap.coach.service;

import java.util.List;

import com.asap.coach.entity.CoachVO;

public interface CoachService_interface {
	String add(CoachVO coach);

	String update(CoachVO coach);

	CoachVO findByPK(String coachNo);

	CoachVO findByCoachEmail(String coachEmail);

	CoachVO findByCoachPhone(String coachPhone);

	List<CoachVO> getAll();
	
	String updatePwd(CoachVO coach);

}
