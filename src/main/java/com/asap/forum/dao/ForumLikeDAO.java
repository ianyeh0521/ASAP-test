package com.asap.forum.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

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
		return getSession().createQuery("select count(*) from ForumLikeVO where postNo= :postNo AND likeStat=true", Long.class)
				.setParameter("postNo", postNo)
				.uniqueResult();
	}
	@Override
	public ForumLikeVO postisLiked(String mbrNo, Integer postNo) {
		Query query=getSession().createQuery("FROM ForumLikeVO WHERE mbrNo = :mbrNo AND postNo = :postNo", ForumLikeVO.class)
		.setParameter("mbrNo", mbrNo)
		.setParameter("postNo", postNo);
		ForumLikeVO forumLike = (ForumLikeVO) query.uniqueResult();
		return forumLike;
	}
	@Override
	public ForumLikeVO cmtisLiked(String mbrNo, Integer cmtNo) {
		Query query=getSession().createQuery("FROM ForumLikeVO WHERE mbrNo = :mbrNo AND cmtNo = :cmtNo", ForumLikeVO.class)
				.setParameter("mbrNo", mbrNo)
				.setParameter("cmtNo", cmtNo);
		ForumLikeVO forumLike = (ForumLikeVO) query.uniqueResult();
		return forumLike;
	}

}
