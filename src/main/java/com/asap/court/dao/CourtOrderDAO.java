package com.asap.court.dao;

import java.sql.Date;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.court.entity.CourtClosedTimeVO;
import com.asap.court.entity.CourtOrderVO;
import com.asap.member.entity.MemberVO;
import com.asap.util.HibernateUtil;

public class CourtOrderDAO implements CourtOrderDAO_interface{
	private SessionFactory factory;
	
	public CourtOrderDAO(){
		factory = HibernateUtil.getSessionFactory();
	}
	
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int update(CourtOrderVO entity) {
		// 更新（取消訂單，更改stat），成功回傳 1，失敗回傳 -1
		try {
			CourtOrderVO courtOrderUpdate = (CourtOrderVO) getSession().get(CourtOrderVO.class, entity.getCourtOrdNo());
			if(courtOrderUpdate != null) {
				courtOrderUpdate.setCourtOrdNo(entity.getCourtOrdNo());
				courtOrderUpdate.setCourtOrdDate(entity.getCourtOrdDate());
				courtOrderUpdate.setCourtOrdTime(entity.getCourtOrdTime());
				courtOrderUpdate.setCourtVO(entity.getCourtVO());
				courtOrderUpdate.setMemberVO(entity.getMemberVO());
				courtOrderUpdate.setTotalPrice(entity.getTotalPrice());
				courtOrderUpdate.setCourtOrdStat(entity.getCourtOrdStat());
			}
			getSession().update(courtOrderUpdate);
			return 1;
			
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int insert(CourtOrderVO courtOrderVO) {
		// 新增成功回傳自增主鍵值，失敗回傳 -1
		try {
			courtOrderVO.toString();
			return (Integer) getSession().save(courtOrderVO);
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public CourtOrderVO findByPK(Integer courtOrdNo) {
		// 以 PK 來找 CourtOrderVO，成功回傳該 VO，失敗回傳 null
		try {
			return getSession().get(CourtOrderVO.class, courtOrdNo);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CourtOrderVO> findByMember(String mbrNo) {
		// 以 mbrNo 尋找 CourtOrderVO，成功回傳 CourtOrderVO List，失敗回傳 null
		try {
			String hql = "from CourtOrderVO co where co.memberVO.mbrNo = :mbrNo order by co.courtOrdDate DESC";
			Query query = getSession().createQuery(hql);
			query.setParameter("mbrNo", mbrNo);
			return query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	

	@Override
	public List<CourtOrderVO> findByCourtNoAndDate(Integer courtNo, Date courtOrdDate) {
		// 以 courtNo 尋找 CourtOrderVO，成功回傳 CourtOrderVO List，失敗回傳 null
		try {
			String hql = "from CourtOrderVO co where co.courtVO.courtNo = :courtNo "
					+ "AND co.courtOrdDate = :courtOrdDate";
			Query query = getSession().createQuery(hql);
			query.setParameter("courtNo", courtNo);
			query.setParameter("courtOrdDate", courtOrdDate);
			return query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CourtOrderVO> getAll() {
		// 找全部 CourtOrderVO，成功回傳 CourtOrderVO List，失敗回傳 null
		try {
			return getSession().createQuery("from CourtOrderVO", CourtOrderVO.class).list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public CourtOrderVO checkOrderExistence(Integer courtNo, Date courtOrdDate, Integer courtOrdTime,
			Integer courtOrdTimeEnd) {
		try {
			String hql = "from CourtOrderVO cord where cord.courtVO.courtNo = :courtNo "
					+ "AND cord.courtOrdDate = :courtOrdDate "
					+ "AND cord.courtOrdTime = :courtOrdTime "
					+ "AND cord.courtOrdTimeEnd = :courtOrdTimeEnd";
			Query query = getSession().createQuery(hql);
			query.setParameter("courtNo", courtNo);
			query.setParameter("courtOrdDate", courtOrdDate);
			query.setParameter("courtOrdTime", courtOrdTime);
			query.setParameter("courtOrdTimeEnd", courtOrdTimeEnd);
			
			CourtOrderVO result = (CourtOrderVO) query.uniqueResult();
			
			return result;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CourtOrderVO> getAllUnPaidCourt(Date currentDate) {
		// 昨天日期轉換
		LocalDate localDate = currentDate.toLocalDate();
		LocalDate oneDayBefore = localDate.minusDays(1);
		java.sql.Date oneDayBeforeDate = java.sql.Date.valueOf(oneDayBefore);
		
		// 開始找
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	            String hql = "FROM CourtOrderVO co " +
	                    "WHERE co.courtOrdStat = false " +
	                    "AND co.courtOrdDate >= :currentDate " +
	                    "AND co.courtOrdCrtTime BETWEEN :oneDayBeforeCurrentDate AND :currentDate";

	            Query<CourtOrderVO> query = session.createQuery(hql, CourtOrderVO.class);
	            query.setParameter("currentDate", currentDate);
	            query.setParameter("oneDayBeforeCurrentDate", oneDayBeforeDate);

	            return query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	

	
	
	
	
	
	
	
}
