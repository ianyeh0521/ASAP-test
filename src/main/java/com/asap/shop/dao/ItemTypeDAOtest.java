package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.asap.shop.entity.ItemTypeVO;
import com.asap.util.HibernateUtil;

public class ItemTypeDAOtest {
	public static void main(String[] args) {
//		新增資料
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			
//			ItemTypeVO s = new ItemTypeVO();
//			s.setItemTypeNo(12);
//			s.setItemTypeName("襪子");
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
//			ItemTypeVO s = session1.get(ItemTypeVO.class, 12);
//			session1.close();
//
//			s.setItemTypeName("褲子");
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
//			ItemTypeVO itemType = session.get(ItemTypeVO.class, 12);
//			if (itemType != null)
//				session.delete(itemType);
//			
//			session.getTransaction().commit();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			session.getTransaction().rollback();
//		} finally {
//			HibernateUtil.shutdown();
//		}

//		查詢單筆商品分類資料
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//
//			ItemTypeVO itemType = session.get(ItemTypeVO.class, 3);
//			System.out.println(itemType);
//
//			session.getTransaction().commit();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			session.getTransaction().rollback();
//		} finally {
//			HibernateUtil.shutdown();
//		}

//		查詢全部(以for迴圈來一行一行排列)
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//
//			List<ItemTypeVO> getALL = session.createQuery("from ItemTypeVO", ItemTypeVO.class).list();
//			for (ItemTypeVO item : getALL) {
//				System.out.println(item);
//			}
//
//			session.getTransaction().commit();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			session.getTransaction().rollback();
//		} finally {
//			HibernateUtil.shutdown();
//		}

	}
}