package com.asap.coach.service;

import java.util.List;

import com.asap.coach.dao.CoachSportTypeDAO;
import com.asap.coach.dao.CoachSportTypeDAO_interface;
import com.asap.coach.entity.CoachSportTypeVO;

public class CoachSportTypeService implements CoachSportTypeService_interface {

	private CoachSportTypeDAO_interface dao;

	public CoachSportTypeService() {
		dao = new CoachSportTypeDAO();
	}

	@Override
	public int add(CoachSportTypeVO coachSportType) {

		return dao.add(coachSportType);
	}

	@Override
	public String delete(CoachSportTypeVO coachSportType) {

		return dao.delete(coachSportType);
	}

	@Override
	public CoachSportTypeVO findVo(String coachNo, int sportTypeNo) {

		return dao.findVo(coachNo, sportTypeNo);
	}

	@Override
	public List<CoachSportTypeVO> findByCoachNo(String coachNo) {

		return dao.findByCoachNo(coachNo);
	}

	@Override
	public List<CoachSportTypeVO> findBySportTypeNo(int sportTypeNo) {

		return dao.findBySportTypeNo(sportTypeNo);
	}

	@Override
	public String cleanByCoachNo(String coachNo) {

		try {
			List<CoachSportTypeVO> list = dao.findByCoachNo(coachNo);
			if (list != null && (!list.isEmpty())) {
				for (CoachSportTypeVO vo : list) {
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
