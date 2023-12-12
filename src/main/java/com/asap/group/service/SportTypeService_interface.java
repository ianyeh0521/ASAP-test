package com.asap.group.service;

import java.util.List;

import com.asap.group.dao.SportTypeDAO;
import com.asap.group.dao.SportTypeDAO_interface;
import com.asap.group.entity.SportTypeVO;

public class SportTypeService_interface implements SportTypeService {
	private SportTypeDAO_interface dao;

	public SportTypeService_interface() {
		dao = new SportTypeDAO();
	}

	@Override
	public SportTypeVO insert(SportTypeVO sportType) {
		dao.insert(sportType);
		return null;
	}

	@Override
	public SportTypeVO update(SportTypeVO sportType) {
		dao.update(sportType);
		return null;
	}

	@Override
	public SportTypeVO findBySportPK(Integer sportTypeNo) {

		return dao.findBySportTypeNo(sportTypeNo);
	}

	@Override
	public List<SportTypeVO> getALL() {
		return dao.getALL();
	}

}
