package com.asap.forum.dao;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.asap.forum.entity.ForumReportVO;
import com.asap.forum.entity.PostVO;
import com.asap.forum.entity.SavePostVO;
import com.asap.util.HibernateUtil;



public class TestHibernate {
	
	public static void main(String[] args) {
		
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
//			String posttitle="一";
			String hql = "from PostVO where postTitle like :posttitle";
			Query query = session.createQuery(hql);
			query.setParameter("posttitle", "%1%");
			List<PostVO> frvo= query.list();
			
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
