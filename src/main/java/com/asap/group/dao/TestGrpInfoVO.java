package com.asap.group.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.asap.group.entity.GrpInfoVO;
import com.asap.group.entity.GrpJoinInfoVO;
import com.asap.util.HibernateUtil;

public class TestGrpInfoVO {
	public static void main(String[] args) {
//		新增資料
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			
//			GrpInfoVO GJ = new GrpInfoVO();
//			
//			
//			GJ.setOrgMbrNo("M00066");
//			GJ.setSportTypeNo(8);
//			GJ.setGrpName("羽球,男女不限喔");
//			GJ.setGrpDate(java.sql.Date.valueOf("2023-10-30"));
//			GJ.setGrpStartTime(java.sql.Time.valueOf("13:00:00"));
//			GJ.setGrpEndTime(java.sql.Time.valueOf("15:00:00"));
//			GJ.setGrpAddress("新北市瑞芳");
//			GJ.setGrpPplLimit(8);
//			GJ.setGrpPplMin(4);
//			GJ.setGrpSignStrTime(java.sql.Timestamp.valueOf("2023-10-01 09:00:00"));
//			GJ.setGrpSignEndTime(java.sql.Timestamp.valueOf("2023-10-29 09:00:00"));
//			GJ.setGrpNote("球拍自備唷");
//			GJ.setGrpImg(null);
//			GJ.setGrpStat(0);
//			
//			
//			session.save(GJ);
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
//			GrpInfoVO GJ = session1.get(GrpInfoVO.class, 2);
//			session1.close();
//
//			GJ.setOrgMbrNo("M0002");
//			GJ.setSportTypeNo(1);
//			GJ.setGrpName("游泳游泳");
//			GJ.setGrpDate(java.sql.Date.valueOf("2023-07-30"));
//			GJ.setGrpStartTime(java.sql.Time.valueOf("13:00:00"));
//			GJ.setGrpEndTime(java.sql.Time.valueOf("15:00:00"));
//			GJ.setGrpAddress("新北市永和");
//			GJ.setGrpPplLimit(6);
//			GJ.setGrpPplMin(2);
//			GJ.setGrpSignStrTime(java.sql.Timestamp.valueOf("2023-07-01 09:00:00"));
//			GJ.setGrpSignEndTime(java.sql.Timestamp.valueOf("2023-07-29 09:00:00"));
//			GJ.setGrpNote("嗨嗨");
//			GJ.setGrpImg(null);
//			GJ.setGrpStat(0);
//
//			Session session2 = factory.openSession();
//			Transaction tx = session2.beginTransaction();
//			
//			session2.update(GJ);
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
//			GrpInfoVO grpInfo = session.get(GrpInfoVO.class,6);
//			if (grpInfo != null)
//				session.delete(grpInfo);
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
//			GrpInfoVO grpInfo = session.get(GrpInfoVO.class, 1);
//			System.out.println(grpInfo);
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
//			List<GrpInfoVO> getALL = session.createQuery("from GrpInfoVO",GrpInfoVO.class).list();
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
		
		
//		(HQL)用某個欄位來找揪團資訊
		GrpInfoDAO grpInfoDAO = new GrpInfoDAO();

      List<GrpInfoVO> resultList = grpInfoDAO.getQuery("OrgMbrNo","M0005");
      for (GrpInfoVO result : resultList) {
          System.out.println("Group Name: " + result.getGrpName());
          System.out.println("Sport Type No: " + result.getSportTypeNo());
          System.out.println("Group Date: " + result.getGrpDate());
          System.out.println("Group Start Time: " + result.getGrpStartTime());
          System.out.println("Group End Time: " + result.getGrpEndTime());
          System.out.println("Group Address: " + result.getGrpAddress());
          System.out.println("===========================================");
      }
		
	}
}
