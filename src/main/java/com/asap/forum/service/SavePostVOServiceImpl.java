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
}
