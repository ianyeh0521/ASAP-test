package com.asap.court.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.court.entity.CourtOrderVO;
import com.asap.court.entity.CourtSaveListVO;
import com.asap.util.HibernateUtil;

public class CourtSaveListDAO implements CourtSaveListDAO_interface{
	private SessionFactory factory;
	
	public CourtSaveListDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(CourtSaveListVO courtSaveListVO) {
		// 新增成功回傳自增主鍵值，失敗回傳 -1
		try {
			courtSaveListVO.toString();
			return (Integer) getSession().save(courtSaveListVO);
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int delete(Integer courtSaveNo) {
		CourtSaveListVO courtSaveListVO = getSession().get(CourtSaveListVO.class, courtSaveNo);
		// 刪除成功回傳 1，刪除失敗回傳 -1
		if (courtSaveListVO != null) {
			getSession().delete(courtSaveListVO);
			return 1;
		}else {
			return -1;
		}
	}

	@Override
	public CourtSaveListVO findByPK(Integer courtSaveNo) {
		// 以 PK 來找 CourtOrderVO，成功回傳該 VO，失敗回傳 null
		try {
			return getSession().get(CourtSaveListVO.class, courtSaveNo);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CourtSaveListVO> findByMember(String mbrNo) {
		// 以 mbrNo 尋找 CourtSaveListVO，成功回傳 CourtSaveListVO List，失敗回傳 null
		try {
			String hql = "from CourtSaveListVO csl where csl.memberVO.mbrNo = :mbrNo";
			Query query = getSession().createQuery(hql);
			query.setParameter("mbrNo", mbrNo);
			return query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CourtSaveListVO> getAll() {
		// 找全部 CourtSaveListVO，成功回傳 CourtSaveListVO List，失敗回傳 null
		try {
			return getSession().createQuery("from CourtSaveListVO", CourtSaveListVO.class).list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	
	
}
