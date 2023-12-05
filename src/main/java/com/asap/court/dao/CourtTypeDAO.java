package com.asap.court.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.court.entity.CourtTypeVO;
import com.asap.court.entity.CourtVO;
import com.asap.util.HibernateUtil;

public class CourtTypeDAO implements CourtTypeDAO_interface{

	private SessionFactory factory;
	
	public CourtTypeDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	// Session 為 not thread-safe，所以此方法在各個增刪改查方法裡呼叫
	// 以避免請求執行緒共用了同個 Session
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int update(CourtTypeVO entity) {
		// 更新成功回完 1，失敗回傳 -1
		try {
			getSession().update(entity);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int delete(Integer id) {
		CourtTypeVO courtTypeVO = getSession().get(CourtTypeVO.class, id);
		if (courtTypeVO != null) {
			getSession().delete(courtTypeVO);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
	public CourtTypeVO getByPK(Integer id) {
		// 用 PK 找 CourtTypeVO，成功回傳該 CourtTypeVO，失敗回傳 null
		try {
			return getSession().get(CourtTypeVO.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	

	@Override
	public List<CourtVO> findCourtByCourtType(Integer id) {
		// 用 CourtTypeNo 找 CourtVO，成功回傳 CourtVO List，失敗回傳 null
		try {
			String hql = "from CourtVO ct where ct.courtTypeVO.courtTypeNo = :courtTypeNo";
			Query query = getSession().createQuery(hql);
			query.setParameter("courtTypeNo", id);
			return query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
		
		
	}

	@Override
	public List<CourtTypeVO> getAll() {
		// 找全部 CourtTypeVO，成功回傳 CourtTypeVO List，失敗回傳 null
		try {
			return getSession().createQuery("from CourtTypeVO", CourtTypeVO.class).list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
