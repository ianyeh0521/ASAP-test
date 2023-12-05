package com.asap.forum.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.asap.forum.entity.ForumLikeVO;
import com.asap.util.HibernateUtil;

public class ForumLikeDAO implements ForumLikeDAO_interface {

	private SessionFactory factory;

	public ForumLikeDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	private Session getSession() {
		return factory.getCurrentSession();
	}
	@Override
	public Integer add(ForumLikeVO forumlike) {
		return (Integer)getSession().save(forumlike);
	}

	@Override
	public Integer update(ForumLikeVO forumlike) {
		try {
			getSession().update(forumlike);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public List<ForumLikeVO> findMyLike(String mbrNo) {
		return getSession().createQuery("from ForumLikeVO where mbrNo= :mbrno", ForumLikeVO.class)
				.setParameter("mbrno", mbrNo)
				.list();
	}

	@Override
	public Long getLikes(Integer postNo) {
		return getSession().createQuery("select count(*) from ForumLikeVO where postNo= :postno", Long.class)
			   .uniqueResult();
	}

}
