package com.asap.coach.service;

import java.util.List;

import com.asap.coach.entity.SportCertVO;

public interface SportCertService_interface {
	int add(SportCertVO SportCert);

	String delete(SportCertVO SportCert);

	SportCertVO findByPK(int sportCertNo);

	List<SportCertVO> findByCoachNo(String coachNo);

	List<SportCertVO> findBySportTypeNo(int sportTypeNo);

	SportCertVO findVO(String coachNo, int sportTypeNo);

	String cleanByCoachNo(String coachNo);
}
