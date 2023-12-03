package com.asap.group.dao;

import java.util.List;

import org.hibernate.Session;

import com.asap.group.entity.GrpJoinInfoVO;
import com.asap.util.HibernateUtil;

public class TestGrpJoinInfoVO {
	public static void main(String[] args) {
//		新增資料
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			
//			GrpJoinInfoVO J = new GrpJoinInfoVO();
//			J.setOrgMbrNo("M00055");
//			J.setPartiMbrNo("M013");
//			J.setGrpNo(4);
//			J.setGrpJoinStat(true);
//			
//			session.save(J);
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
//			GrpJoinInfoVO J = session1.get(GrpJoinInfoVO.class, 7);
//			session1.close();
//
//			J.setOrgMbrNo("M00056");
//			J.setPartiMbrNo("M015");
//			J.setGrpNo(2);
//			J.setGrpJoinStat(true);
//
//			Session session2 = factory.openSession();
//			Transaction tx = session2.beginTransaction();
//			
//			session2.update(J);
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
//			GrpJoinInfoVO grpJoinInfo = session.get(GrpJoinInfoVO.class, 7);
//			if (grpJoinInfo != null)
//				session.delete(grpJoinInfo);
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
//			GrpJoinInfoVO grpJoinInfo = session.get(GrpJoinInfoVO.class, 2);
//			System.out.println(grpJoinInfo);
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
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//
//			List<GrpJoinInfoVO> getALL = session.createQuery("from GrpJoinInfoVO",GrpJoinInfoVO.class).list();
//			System.out.println(getALL);
//			
//			session.getTransaction().commit();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			session.getTransaction().rollback();
//		} finally {
//			HibernateUtil.shutdown();
//		}
		
		
		
//		(HQL)用某個欄位來找參與人資訊
		GrpJoinInfoDAO grpJoinInfoDAO = new GrpJoinInfoDAO();
		
      List<GrpJoinInfoVO> resultList = grpJoinInfoDAO.getQuery("OrgMbrNo","M0001");
      for (GrpJoinInfoVO result : resultList) {
          System.out.println("Sport Type No: " + result.getGrpJoinInfoNo());
          System.out.println("Group Date: " + result.getPartiMbrNo());
          System.out.println("Group Start Time: " + result.getGrpNo());
          System.out.println("Group End Time: " + result.getGrpJoinStat());
          System.out.println("===========================================");

      }
	}
}
