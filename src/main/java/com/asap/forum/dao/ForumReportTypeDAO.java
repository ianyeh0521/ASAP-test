package com.asap.forum.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.asap.forum.entity.ForumReportTypeVO;
import com.asap.util.HibernateUtil;


public class ForumReportTypeDAO implements ForumReportTypeDAO_interface {

	private SessionFactory factory;

	public ForumReportTypeDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	private Session getSession() {
		return factory.getCurrentSession();
	}
	
	@Override
	public ForumReportTypeVO findbyPK(Integer fRptTypeNo) {
		return getSession().get(ForumReportTypeVO.class, fRptTypeNo);
	}

}
