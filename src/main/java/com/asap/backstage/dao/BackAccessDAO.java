package com.asap.backstage.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.backstage.entity.BackAccessVO;
import com.asap.util.HibernateUtil;

public class BackAccessDAO implements BackAccessDAO_interface {

	private SessionFactory factory;

	public BackAccessDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int add(BackAccessVO backAce) {
		try {

			Integer id = (Integer) getSession().save(backAce);

			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

	@Override
	public String delete(BackAccessVO backAce) {
		try {

			if (backAce != null) {
				getSession().delete(backAce);
			}
			return "成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "失敗";
		}
	}

	@Override
	public List<BackAccessVO> findByBackNo(String backNo) {
		try {
			Query<BackAccessVO> query = getSession().createQuery("from BackAccessVO where backNo = :backNo",
					BackAccessVO.class);
			query.setParameter("backNo", backNo);
			List<BackAccessVO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<BackAccessVO> findByBackAceTypeNo(int backAceTypeNo) {
		try {

			Query<BackAccessVO> query = getSession()
					.createQuery("from BackAccessVO where backAceTypeNo = :backAceTypeNo", BackAccessVO.class);
			query.setParameter("backAceTypeNo", backAceTypeNo);
			List<BackAccessVO> list = query.list();

			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public BackAccessVO findVo(String backNo, int backAceTypeNo) {
		try {

			Query<BackAccessVO> query = getSession().createQuery(
					"from BackAccessVO where backNo = :backNo and backAceTypeNo = :backAceTypeNo", BackAccessVO.class);
			query.setParameter("backNo", backNo);
			query.setParameter("backAceTypeNo", backAceTypeNo);
			BackAccessVO backAccessVO = query.uniqueResult();
			return backAccessVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
}
