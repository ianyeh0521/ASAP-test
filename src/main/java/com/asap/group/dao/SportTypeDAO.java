package com.asap.group.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.asap.group.entity.SportTypeVO;
import com.asap.util.HibernateUtil;

public class SportTypeDAO implements SportTypeDAO_interface {
	private SessionFactory factory;

	public SportTypeDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(SportTypeVO sportType) {
		return (Integer) getSession().save(sportType);
	}

	@Override
	public int update(SportTypeVO sportType) {

		try {
			getSession().update(sportType);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public SportTypeVO findBySportTypeNo(Integer sportTypeNo) {
		return getSession().get(SportTypeVO.class, sportTypeNo);
	}

	@Override
	public List<SportTypeVO> getALL() {
		Transaction transaction = null;
		try {
			Session session = getSession();
			transaction = session.beginTransaction();
			List<SportTypeVO> list = session.createQuery("from SportTypeVO", SportTypeVO.class).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
