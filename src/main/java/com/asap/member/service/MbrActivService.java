package com.asap.member.service;

import java.util.List;

import com.asap.member.dao.MbrActivDAO;
import com.asap.member.dao.MbrActivDAO_interface;
import com.asap.member.entity.MbrActivVO;

public class MbrActivService implements MbrActivService_interface{
	
	private MbrActivDAO_interface dao;
	
	public MbrActivService() {
		dao = new MbrActivDAO();
	}

	@Override
	public int add(MbrActivVO mbrActiv) {
	
		return dao.add(mbrActiv);
	}

	@Override
	public String delete(MbrActivVO mbrActiv) {
		
		return dao.delete(mbrActiv);
	}

	@Override
	public List<MbrActivVO> findByMbrNo(String mbrNo) {
		
		return dao.findByMbrNo(mbrNo);
	}

	@Override
	public MbrActivVO findByPK(String mbrActivNo) {
		
		return dao.findByPK(mbrActivNo);
	}

}
