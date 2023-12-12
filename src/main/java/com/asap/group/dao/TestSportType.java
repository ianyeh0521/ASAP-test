package com.asap.group.dao;

import java.util.List;

import org.hibernate.Session;

import com.asap.group.entity.SportTypeVO;
import com.asap.util.HibernateUtil;

public class TestSportType {
	public static void main(String[] args) {
//		新增資料
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			
//			SportTypeVO s = new SportTypeVO();
//			s.setSportTypeNo(13);
//			s.setSportTypeName("測試");
//			
//			session.save(s);
//			
//			session.getTransaction().commit();
//			
//		} catch (Exception e) {
//			session.getTransaction().rollback();
//			e.printStackTrace();
//		} finally {
//			HibernateUtil.shutdown();
//		}

//		修改資料
//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		try {
//			Session session1 = factory.openSession();
//			SportTypeVO s = session1.get(SportTypeVO.class, 15);
//			session1.close();
//
//			s.setSportTypeName("測試更新");
//
//			Session session2 = factory.openSession();
//			Transaction tx = session2.beginTransaction();
//
//			session2.update(s);
//
//			tx.commit();
//			session2.close();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			HibernateUtil.shutdown();
//		}
//		刪除資料
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			
//			SportTypeVO sportType = session.get(SportTypeVO.class, 15);
//			if (sportType != null)
//				session.delete(sportType);
//			
//			session.getTransaction().commit();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			session.getTransaction().rollback();
//		} finally {
//			HibernateUtil.shutdown();
//		}
//		查詢資料
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//
//			SportTypeVO sportType = session.get(SportTypeVO.class, 3);
//			System.out.println(sportType);
//
//			session.getTransaction().commit();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			session.getTransaction().rollback();
//		} finally {
//			HibernateUtil.shutdown();
//		}
//		查詢全部
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			List<SportTypeVO> getALL = session.createQuery("from SportTypeVO",SportTypeVO.class).list();
			System.out.println(getALL);
			
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtil.shutdown();
		}

	}

}
