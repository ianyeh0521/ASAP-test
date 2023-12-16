package com.asap.court.service;

import java.sql.Date;
import java.util.List;

import com.asap.court.dao.CourtOrderDAO;
import com.asap.court.dao.CourtOrderDAO_interface;
import com.asap.court.entity.CourtOrderVO;

public class CourtOrderService implements CourtOrderService_interface{

	private CourtOrderDAO_interface dao;
	
	public CourtOrderService(){
		dao = new CourtOrderDAO();
	}

	@Override
	public int update(CourtOrderVO courtOrderVO) {
		dao.update(courtOrderVO);
		return 1;
	}

	@Override
	public int insert(CourtOrderVO courtOrderVO) {
		return dao.insert(courtOrderVO);
	}

	@Override
	public CourtOrderVO findByPK(Integer courtOrdNo) {
		return dao.findByPK(courtOrdNo);
	}

	@Override
	public List<CourtOrderVO> findByMember(String mbrNo) {
		return dao.findByMember(mbrNo);
	}

	@Override
	public List<CourtOrderVO> getAll() {
		return dao.getAll();
	}

	@Override
	public Boolean checkOrder(Integer courtNo, Date courtOrdDate, Integer courtOrdTime,
			Integer courtOrdTimeEnd) {
		CourtOrderVO courtOrderVO = dao.checkOrderExistence(courtNo, courtOrdDate, courtOrdTime, courtOrdTimeEnd);
		
		if(courtOrderVO == null || courtOrderVO.getCourtOrdStat() == false) {
			// 資料庫沒有或訂單狀態是未付款，可以新增
			return true;
		}
		else{
			return false;
		}
		
	}
	
	
	
	
	
}
