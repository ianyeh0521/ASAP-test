package com.asap.forum.service;

import java.util.List;

import com.asap.forum.dao.SavePostDAO;
import com.asap.forum.dao.SavePostDAO_interface;
import com.asap.forum.entity.SavePostVO;

public class SavePostVOServiceImpl implements SavePostVOService{
	private SavePostDAO_interface dao;
	
	public SavePostVOServiceImpl() {
		dao = new SavePostDAO();
	}

	@Override
	public List<SavePostVO> getAll() {
		// TODO Auto-generated method stub
		return dao.getAll();
	}

	@Override
	public List<SavePostVO> getbyMbrNo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer delete() {
		// TODO Auto-generated method stub
		return null;
	}
}
