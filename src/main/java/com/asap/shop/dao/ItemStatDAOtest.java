package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.asap.shop.entity.ItemStatVO;
import com.asap.util.HibernateUtil;

public class ItemStatDAOtest {
	public static void main(String[] args) {
//		新增資料
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			
//			ItemStatVO s = new ItemStatVO();
//			s.setItemStatNo(5);
//			s.setItemStatText("狀況較差");
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
//			ItemStatVO s = session1.get(ItemStatVO.class, 5);
//			session1.close();
//
//			s.setItemStatText("超級舊");
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
//		
//		刪除資料
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			
//			ItemStatVO itemStat = session.get(ItemStatVO.class, 5);
//			if (itemStat != null)
//				session.delete(itemStat);
//			
//			session.getTransaction().commit();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			session.getTransaction().rollback();
//		} finally {
//			HibernateUtil.shutdown();
//		}
		
//		查詢單筆商品狀態
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//
//			ItemStatVO itemStat = session.get(ItemStatVO.class, 3);
//			System.out.println(itemStat);
//
//			session.getTransaction().commit();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			session.getTransaction().rollback();
//		} finally {
//			HibernateUtil.shutdown();
//		}
		
//		查詢全部商品狀態(以for迴圈來一行一行排列)
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
		    session.beginTransaction();

		    List<ItemStatVO> getALL = session.createQuery("from ItemStatVO", ItemStatVO.class).list();
		    for (ItemStatVO item : getALL) {
		        System.out.println(item);
		    }

		    session.getTransaction().commit();

		} catch (Exception e) {
		    e.printStackTrace();
		    session.getTransaction().rollback();
		} finally {
		    HibernateUtil.shutdown();
		}
		
		
	}
}