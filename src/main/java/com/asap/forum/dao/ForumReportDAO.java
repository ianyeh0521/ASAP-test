package com.asap.forum.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.asap.forum.entity.ForumReportVO;
import com.asap.util.HibernateUtil;

public class ForumReportDAO implements ForumReportDAO_interface {

	private SessionFactory factory;

	public ForumReportDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	private Session getSession() {
		return factory.getCurrentSession();
	}
	
	@Override
	public Integer add(ForumReportVO forumReport) {
		return (Integer)getSession().save(forumReport);
	}

	@Override
	public Integer update(ForumReportVO forumReport) {
		try {
			getSession().update(forumReport);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public List<ForumReportVO> getAll() {
		return getSession().createQuery("from ForumReportVO", ForumReportVO.class).list();
	}

}
