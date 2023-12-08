package com.asap.coach.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.coach.entity.CoachSportTypeVO;
import com.asap.util.HibernateUtil;

public class CoachSportTypeDAO implements CoachSportTypeDAO_interface {

	private SessionFactory factory;

	public CoachSportTypeDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();

	}

	@Override
	public int add(CoachSportTypeVO coachSportType) {
		try {
			Integer id = (Integer) getSession().save(coachSportType);
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public String delete(CoachSportTypeVO coachSportType) {
		try {
			getSession().update(coachSportType);
			return "更新成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "更新失敗";
		}
	}

	@Override
	public CoachSportTypeVO findVo(String coachNo, int sportTypeNo) {
		try {

			Query<CoachSportTypeVO> query = getSession().createQuery(
					"from CoachSportTypeVO where coachNo = :coachNo and sportTypeNo = :sportTypeNo",
					CoachSportTypeVO.class);
			query.setParameter("coachNo", coachNo);
			query.setParameter("sportTypeNo", sportTypeNo);
			CoachSportTypeVO coachSportTypeVO = query.uniqueResult();
			return coachSportTypeVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CoachSportTypeVO> findByCoachNo(String coachNo) {
		try {

			Query<CoachSportTypeVO> query = getSession().createQuery("from CoachSportTypeVO where coachNo = :coachNo",
					CoachSportTypeVO.class);
			query.setParameter("coachNo", coachNo);
			List<CoachSportTypeVO> list = query.list();

			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CoachSportTypeVO> findBySportTypeNo(int sportTypeNo) {
		try {

			Query<CoachSportTypeVO> query = getSession()
					.createQuery("from CoachSportTypeVO where sportTypeNo = :sportTypeNo", CoachSportTypeVO.class);
			query.setParameter("sportTypeNo", sportTypeNo);
			List<CoachSportTypeVO> list = query.list();

			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
}
