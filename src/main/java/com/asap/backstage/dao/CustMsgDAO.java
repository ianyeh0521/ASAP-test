package com.asap.backstage.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.asap.backstage.entity.CustMsgVO;
import com.asap.util.HibernateUtil;

public class CustMsgDAO implements CustMsgDAO_interface {

	private SessionFactory factory;

	public CustMsgDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int add(CustMsgVO custMsg) {
		try {
			Integer id = (Integer) getSession().save(custMsg);
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public String update(CustMsgVO custMsg) {
		try {
			getSession().update(custMsg);
			return "更新成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "更新失敗";
		}
	}

	@Override
	public CustMsgVO findByPK(int custMsgNo) {
		try {
			CustMsgVO custMsgVO = getSession().get(CustMsgVO.class, custMsgNo);
			return custMsgVO;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<CustMsgVO> findByMbrNo(String mbrNo) {
		try {
			Query query = getSession().createQuery("from CustMsgVO where mbrNo = :mbrNo", CustMsgVO.class);
			query.setParameter("mbrNo", mbrNo);
			List<CustMsgVO> custMsgVOs = query.getResultList();
			return custMsgVOs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CustMsgVO> findByCoachNo(String coachNo) {
		try {
			Query query = getSession().createQuery("from CustMsgVO where coachNo = :coachNo", CustMsgVO.class);
			query.setParameter("coachNo", coachNo);
			List<CustMsgVO> custMsgVOs = query.getResultList();
			return custMsgVOs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
