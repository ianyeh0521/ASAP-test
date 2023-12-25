package com.asap.court.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
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
		
		if(courtOrderVO == null || courtOrderVO.getCourtOrdStat() == 3) {
			// 資料庫沒有或訂單狀態是未付款，可以新增
			return true;
		}
		else{
			return false;
		}
		
	}

	@Override
	public Boolean checkOrderDateAndTime(Integer courtNo, Date courtOrdDate, Integer courtOrdTime,
			Integer courtOrdTimeEnd) {
		
		List<CourtOrderVO> listByCourtNoAndDate = null;
		try {
			listByCourtNoAndDate = dao.findByCourtNoAndDate(courtNo, courtOrdDate);
			int getCount = 0;
			for(CourtOrderVO courtOrderVO: listByCourtNoAndDate) {
				if(((courtOrderVO.getCourtOrdTime()<=courtOrdTime && courtOrderVO.getCourtOrdTimeEnd()>courtOrdTime)
						|| (courtOrderVO.getCourtOrdTime()<courtOrdTimeEnd && courtOrderVO.getCourtOrdTimeEnd()>courtOrdTimeEnd)) 
						&& courtOrderVO.getCourtOrdStat()==2) {	//已成立的訂單
					getCount += 1;
					break;
				}
			}
			System.out.println("getCount="+getCount);
			if(getCount == 0) {
				return true;		// 沒有時間重疊的預約
			}else {
				return false;		// 有時間重疊的預約
			}
		} catch (Exception e) {
			return true;	// 沒有時間重疊的預約
		}
				
		
	}

	@Override
	public List<CourtOrderVO> getAllUnPaidCourt(Timestamp currentTimestamp) {
		return dao.getAllUnPaidCourt(currentTimestamp);
	}
	
	
	
	
	
	
	
	
	
}
