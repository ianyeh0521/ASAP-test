package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.asap.shop.entity.ItemSizeVO;
import com.asap.util.HibernateUtil;

public class ItemSizeDAOtest {
	public static void main(String[] args) {

//		新增資料
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			
//			ItemSizeVO s = new ItemSizeVO();
//			s.setItemSizeNo(7);
//			s.setItemSizeText("XXL");
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
//			ItemSizeVO s = session1.get(ItemSizeVO.class, 7);
//			session1.close();
//
//			s.setItemSizeText("XXXL");
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
//			ItemSizeVO itemSize = session.get(ItemSizeVO.class, 7);
//			if (itemSize != null)
//				session.delete(itemSize);
//			
//			session.getTransaction().commit();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			session.getTransaction().rollback();
//		} finally {
//			HibernateUtil.shutdown();
//		}

//		查詢單筆商品尺寸
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//
//			ItemSizeVO itemSize = session.get(ItemSizeVO.class, 1);
//			System.out.println(itemSize);
//
//			session.getTransaction().commit();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			session.getTransaction().rollback();
//		} finally {
//			HibernateUtil.shutdown();
//		}

//		查詢全部商品尺寸(以for迴圈來一行一行排列)
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//		    session.beginTransaction();
//
//		    List<ItemSizeVO> getALL = session.createQuery("from ItemSizeVO", ItemSizeVO.class).list();
//		    for (ItemSizeVO item : getALL) {
//		        System.out.println(item);
//		    }
//
//		    session.getTransaction().commit();
//
//		} catch (Exception e) {
//		    e.printStackTrace();
//		    session.getTransaction().rollback();
//		} finally {
//		    HibernateUtil.shutdown();
//		}

	}
}