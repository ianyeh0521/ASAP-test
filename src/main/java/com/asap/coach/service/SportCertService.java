package com.asap.coach.service;

import java.util.List;
import com.asap.coach.dao.SportCertDAO;
import com.asap.coach.dao.SportCertDAO_interface;
import com.asap.coach.entity.SportCertVO;

public class SportCertService implements SportCertService_interface {

	SportCertDAO_interface dao;

	public SportCertService() {
		dao = new SportCertDAO();

	}

	@Override
	public int add(SportCertVO SportCert) {

		return dao.add(SportCert);
	}

	@Override
	public String delete(SportCertVO SportCert) {

		return dao.delete(SportCert);
	}

	@Override
	public SportCertVO findByPK(int sportCertNo) {

		return dao.findByPK(sportCertNo);
	}

	@Override
	public List<SportCertVO> findByCoachNo(String coachNo) {

		return dao.findByCoachNo(coachNo);
	}

	@Override
	public List<SportCertVO> findBySportTypeNo(int sportTypeNo) {

		return dao.findBySportTypeNo(sportTypeNo);
	}

	@Override
	public SportCertVO findVO(String coachNo, int sportTypeNo) {

		return dao.findVO(coachNo, sportTypeNo);
	}

	@Override
	public String cleanByCoachNo(String coachNo) {
		try {
			List<SportCertVO> list = dao.findByCoachNo(coachNo);
			if (list != null && (!list.isEmpty())) {
				for (SportCertVO vo : list) {
					dao.delete(vo);
				}
			}
			return "刪除成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "刪除失敗";
		}
	}

}
