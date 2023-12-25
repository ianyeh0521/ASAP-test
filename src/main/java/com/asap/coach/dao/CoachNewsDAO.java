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
//			getSession().beginTransaction();
			Integer id = (Integer) getSession().save(coachNews);
//			getSession().getTransaction().commit();;
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
			Query<CoachNewsVO> query = getSession().createQuery("from CoachNewsVO where coachNo = :coachNo order by newsTime desc",
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
	
//	public static void main(String[] args) {
//		CoachNewsDAO dao = new CoachNewsDAO();
//		CoachNewsVO vo = new CoachNewsVO();
//		
//		vo.setCoachNo("C12042300001");
//		vo.setNewsSubj("課程下架成功通知");
//		vo.setNewsText("球課程下架成功。");
//		vo.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));
//		
//		dao.add(vo);
//
//	}

}
