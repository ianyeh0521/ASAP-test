package com.asap.coach.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import com.asap.coach.entity.SportCertVO;
import com.asap.util.HibernateUtil;

public class SportCertDAO implements SportCertDAO_interface {

	private SessionFactory factory;

	public SportCertDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int add(SportCertVO SportCert) {
		try {

			Integer id = (Integer) getSession().save(SportCert);

			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public String delete(SportCertVO SportCert) {
		try {

			if (SportCert != null) {
				getSession().delete(SportCert);
			}
			return "成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "失敗";
		}
	}

	@Override
	public SportCertVO findByPK(int sportCertNo) {
		try {

			Query<SportCertVO> query = getSession().createQuery("from SportCertVO where sportCertNo = :sportCertNo",
					SportCertVO.class);
			query.setParameter("sportCertNo", sportCertNo);

			SportCertVO sportCertVO = query.uniqueResult();
			return sportCertVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<SportCertVO> findByCoachNo(String coachNo) {
		try {
			Query<SportCertVO> query = getSession().createQuery("from SportCertVO where coachNo = :coachNo",
					SportCertVO.class);
			query.setParameter("coachNo", coachNo);

			List<SportCertVO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<SportCertVO> findBySportTypeNo(int sportTypeNo) {
		try {
			Query<SportCertVO> query = getSession().createQuery("from SportCertVO where sportTypeNo = :sportTypeNo",
					SportCertVO.class);
			query.setParameter("sportTypeNo", sportTypeNo);
			List<SportCertVO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public SportCertVO findVO(String coachNo, int sportTypeNo) {
		try {

			Query<SportCertVO> query = getSession().createQuery(
					"from SportCertVO where coachNo = :coachNo and sportTypeNo = :sportTypeNo", SportCertVO.class);
			query.setParameter("coachNo", coachNo);
			query.setParameter("sportTypeNo", sportTypeNo);

			SportCertVO sportCertVO = query.uniqueResult();
			return sportCertVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
