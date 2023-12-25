package com.asap.court;

import java.math.BigDecimal;
import java.sql.Date;

import org.hibernate.Session;

import com.asap.court.dao.CourtDAO;
import com.asap.court.dao.CourtDAO_interface;
import com.asap.court.dao.CourtOrderDAO;
import com.asap.court.entity.CourtOrderVO;
import com.asap.court.entity.CourtTypeVO;
import com.asap.court.entity.CourtVO;
import com.asap.court.entity.SiteVO;
import com.asap.court.service.CourtService;
import com.asap.court.service.CourtService_interface;
import com.asap.util.HibernateUtil;

public class TestCRUD {

	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			// 新增訂單測試
			CourtOrderVO courtOrderVO = new CourtOrderVO();
			CourtDAO_interface dao = new CourtDAO();
			courtOrderVO.setCourtVO(dao.getById(1));
			courtOrderVO.setCourtOrdDate(Date.valueOf("2023-12-03"));
			courtOrderVO.setCourtOrdStat(0);
			courtOrderVO.setCourtOrdTime(15);
			courtOrderVO.setTotalPrice(1600);
//			courtOrderVO.setMemberVO();
			
		}catch(Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}finally {
			HibernateUtil.shutdown();
		}
	}
}
