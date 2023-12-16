package com.asap.member.service;

import java.util.List;

import com.asap.member.dao.MbrNewsDAO;
import com.asap.member.dao.MbrNewsDAO_interface;
import com.asap.member.entity.MbrNewsVO;

public class MbrNewsService implements MbrNewsService_interface{
	
	private MbrNewsDAO_interface dao;
	
	public MbrNewsService() {
		dao = new MbrNewsDAO();
	}

	@Override
	public int add(MbrNewsVO mbrNews) {
	
		return dao.add(mbrNews);
	}

	@Override
	public String delete(MbrNewsVO mbrNews) {
		
		return dao.delete(mbrNews);
	}

	@Override
	public List<MbrNewsVO> findByMbrNo(String mbrNo) {
		
		return dao.findByMbrNo(mbrNo);
	}

	@Override
	public MbrNewsVO findByPK(String mbrNewsNo) {
		
		return dao.findByPK(mbrNewsNo);
	}

}
