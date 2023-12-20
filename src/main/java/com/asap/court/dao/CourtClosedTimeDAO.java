package com.asap.court.dao;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.swing.event.ListDataListener;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.loader.plan.build.internal.returns.AbstractEntityReference;
import org.hibernate.query.Query;

import com.asap.court.entity.CourtClosedTimeVO;
import com.asap.util.HibernateUtil;

public class CourtClosedTimeDAO implements CourtClosedTimeDAO_interface{

	private SessionFactory factory;
	
	public CourtClosedTimeDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(CourtClosedTimeVO courtclosedtimeVO) {
		// 新增成功回傳自增主鍵值，失敗回傳 -1
		try {
			return (Integer) getSession().save(courtclosedtimeVO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
			
		}
	}

	@Override
	public int delete(Integer courtClosedTimeNo) {
		CourtClosedTimeVO courtClosedTimeVO = getSession().get(CourtClosedTimeVO.class, courtClosedTimeNo);
		// 刪除成功回傳 1，刪除失敗回傳 -1
		if (courtClosedTimeVO != null) {
			getSession().delete(courtClosedTimeVO);
			return 1;
		} else {
			return -1;
		}
	}

	@Override
	public List<CourtClosedTimeVO> findByCourtNo(Integer courtNo) {
		// 以 courtNo 尋找 CourtClosedTimeVO，成功回傳 CourtClosedTimeVO List，失敗回傳 null
		try {
			String hql = "from CourtClosedTimeVO cctv where cctv.courtVO.courtNo = :courtNo";
			Query query = getSession().createQuery(hql);
			query.setParameter("courtNo", courtNo);
			return query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public List<CourtClosedTimeVO> getAll() {
		// 找全部 CourtClosedTimeVO，成功回傳 CourtClosedTimeVO List，失敗回傳 null
		try {
			return getSession().createQuery("from CourtClosedTimeVO", CourtClosedTimeVO.class).list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public Boolean existsDeter(Integer courtNo, Date courtClosedDate, Integer courtClosedTime) {
		// 新增時判斷是否有存在 courtNo, courtClosedDate, courtClosedTime 都相同的資料，有則回傳 true，無則回傳 false，若查詢失敗也回傳 true 避免程式繼續執行
		try {
			String hql = "from CourtClosedTimeVO cctv where cctv.courtVO.courtNo = :courtNo "
					+ "AND cctv.courtClosedDate = :courtClosedDate "
					+ "AND cctv.courtClosedTime = :courtClosedTime";
			Query query = getSession().createQuery(hql);
			query.setParameter("courtNo", courtNo);
			query.setParameter("courtClosedDate", courtClosedDate);
			query.setParameter("courtClosedTime", courtClosedTime);
			
			List<CourtClosedTimeVO> DataList = null;
			DataList = query.list();
			System.out.println(DataList.size());
			if(DataList.size() == 0) {
				return false;
			}else {
				return true;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			return true;
		}
		
	
	}

	@Override
	public int deleteBeforeNow() {
		LocalDate today = LocalDate.now();
		try {
			String hql = "DELETE FROM CourtClosedTimeVO c WHERE c.courtClosedDate < :today";
			Query query = getSession().createQuery(hql);
			query.setParameter("today", java.sql.Date.valueOf(today));
			query.executeUpdate();
			System.out.println("刪除了" + today + "（今天）以前的所有資料");
			return 1;
		} catch (HibernateException e) {
			e.printStackTrace();
			return -1;
		}
		
		
	}

	@Override
	public List<CourtClosedTimeVO> findByDate(Integer courtNo, Date courtClosedDate) {
		try {
			String hql = "from CourtClosedTimeVO cctv where cctv.courtVO.courtNo = :courtNo "
						+ "AND cctv.courtClosedDate = :courtClosedDate ";
			Query query = getSession().createQuery(hql);
			query.setParameter("courtNo", courtNo);
			query.setParameter("courtClosedDate", courtClosedDate);
			return query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	
	
	
	
}
