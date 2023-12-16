package com.asap.coach.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.coach.entity.CoachNewsVO;
import com.asap.util.HibernateUtil;

public class CoachNewsDAO implements CoachNewsDAO_interface {

	private SessionFactory factory;

	public CoachNewsDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int add(CoachNewsVO coachNews) {
		try {
			Integer id = (Integer) getSession().save(coachNews);

			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public String delete(CoachNewsVO coachNews) {
		try {

			if (coachNews != null) {
				getSession().delete(coachNews);
			}
			return "成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "失敗";
		}
	}

	@Override
	public List<CoachNewsVO> findByCoachNo(String coachNo) {
		try {
			Query<CoachNewsVO> query = getSession().createQuery("from CoachNewsVO where coachNo = :coachNo",
					CoachNewsVO.class);
			query.setParameter("coachNo", coachNo);
			List<CoachNewsVO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public CoachNewsVO findByPK(String coachNewsNo) {
		try {
			Query<CoachNewsVO> query = getSession().createQuery("from CoachNewsVO where coachNewsNo = :coachNewsNo",
					CoachNewsVO.class);
			query.setParameter("coachNewsNo", coachNewsNo);
			CoachNewsVO vo = query.uniqueResult();
			return vo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
