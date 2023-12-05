package com.asap.backstage.service;

import java.util.List;

import com.asap.backstage.dao.BackAccessTypeDAO;
import com.asap.backstage.dao.BackAccessTypeDAO_interface;
import com.asap.backstage.entity.BackAccessTypeVO;

public class BackAccessTypeService implements BackAccessTypeService_interface {

	private BackAccessTypeDAO_interface dao;

	public BackAccessTypeService() {
		dao = new BackAccessTypeDAO();
	}

	@Override
	public int add(BackAccessTypeVO backType) {
		// 給編號
		int num = dao.countAll();
		num++;
		backType.setBackAceTypeNo(num);
		return dao.add(backType);
	}

	@Override
	public String update(BackAccessTypeVO backType) {

		return dao.update(backType);
	}

	@Override
	public String findByPK(int backTypeNo) {

		return dao.findByPK(backTypeNo).getBackAceTypeName();
	}

	@Override
	public List<BackAccessTypeVO> getAll() {

		return dao.getAll();
	}

	@Override
	public int countAll() {

		return dao.countAll();
	}

}
