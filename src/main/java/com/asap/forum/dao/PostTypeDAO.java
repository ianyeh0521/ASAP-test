package com.asap.forum.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.asap.forum.entity.ForumReportTypeVO;
import com.asap.forum.entity.PostTypeVO;
import com.asap.forum.entity.PostVO;
import com.asap.util.HibernateUtil;

public class PostTypeDAO implements PostTypeDAO_interface {

	private SessionFactory factory;

	public PostTypeDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	
	private Session getSession() {
		return factory.getCurrentSession();
	}
	
	
	@Override
	public PostTypeVO findbyPK(Integer postTypeNo) {
		return getSession().get(PostTypeVO.class, postTypeNo);
	}
}
