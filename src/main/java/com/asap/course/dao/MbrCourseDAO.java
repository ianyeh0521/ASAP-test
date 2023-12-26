package com.asap.course.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.course.entity.MbrCourseVO;
import com.asap.util.HibernateUtil;

public class MbrCourseDAO implements MbrCourseDAO_interface{

	private SessionFactory factory;
	
	public MbrCourseDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int update(MbrCourseVO mbrCourseVO) {
//		成功更新回傳 1，失敗回傳 -1
		try {
			MbrCourseVO mbrCourseUpdate = (MbrCourseVO) getSession().get(MbrCourseVO.class, mbrCourseVO.getMbrCourseNo());
			if(mbrCourseUpdate != null) {
				mbrCourseUpdate.setMbrCourseNo(mbrCourseVO.getMbrCourseNo());
				mbrCourseUpdate.setMbrCourseTime(mbrCourseVO.getMbrCourseTime());
				mbrCourseUpdate.setMbrCourseStat(mbrCourseVO.getMbrCourseStat());
				mbrCourseUpdate.setCoachVO(mbrCourseVO.getCoachVO());
				mbrCourseUpdate.setCourseVO(mbrCourseVO.getCourseVO());
				mbrCourseUpdate.setMemberVO(mbrCourseVO.getMemberVO());
			}
			getSession().update(mbrCourseUpdate);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int insert(MbrCourseVO mbrCourseVO) {
		// 新增成功回傳自增主鍵值，失敗回傳 -1
		try {
			mbrCourseVO.toString();
			return (Integer) getSession().save(mbrCourseVO);
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int delete(Integer mbrCourseNo) {
		MbrCourseVO mbrCourseVO = getSession().get(MbrCourseVO.class, mbrCourseNo);
		if (mbrCourseVO != null) {
			getSession().delete(mbrCourseVO);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
	public MbrCourseVO findByPK(Integer mbrCourseNo) {
		// 以 PK 來找 MbrCourseVO，成功回傳該 VO，失敗回傳 null
		try {
			return getSession().get(MbrCourseVO.class, mbrCourseNo);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<MbrCourseVO> findByCourseNo(Integer courseNo) {
		String hql = "from MbrCourseVO mbrcs where mbrcs.courseVO.courseNo = :getno and mbrcs.mbrCourseStat = true";
		Query query = getSession().createQuery(hql);
		query.setParameter("getno", courseNo);
		return query.list();
	}

	@Override
	public List<MbrCourseVO> findByMember(String mbrNo) {
		String hql = "from MbrCourseVO mbrcs where mbrcs.memberVO.mbrNo = :getno";
		Query query = getSession().createQuery(hql);
		query.setParameter("getno", mbrNo);
		return query.list();
	}

	@Override
	public List<MbrCourseVO> findByCoach(String coachNo) {
		String hql = "from MbrCourseVO mbrcs where mbrcs.coachVO.coachNo = :getno";
		Query query = getSession().createQuery(hql);
		query.setParameter("getno", coachNo);
		return query.list();
	}

	@Override
	public List<MbrCourseVO> getAll() {
		// 取得全部的 CourseVO List，成功回傳 List，失敗回傳空值
		try {
			return getSession().createQuery("from MbrCourseVO", MbrCourseVO.class).list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	
}
