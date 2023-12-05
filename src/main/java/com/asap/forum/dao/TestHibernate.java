package com.asap.forum.dao;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;

import com.asap.forum.entity.ForumReportVO;
import com.asap.forum.entity.PostVO;
import com.asap.forum.entity.SavePostVO;
import com.asap.util.HibernateUtil;



public class TestHibernate {
	
	public static void main(String[] args) {
		
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
			List<PostVO> frvo= session.createQuery("from PostVO order by postCrtTime", PostVO.class).list();
			
			System.out.println(frvo);
			
			session.getTransaction().commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtil.shutdown();
		}
		
	}
}
