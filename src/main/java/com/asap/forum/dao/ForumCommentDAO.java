package com.asap.forum.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.asap.forum.entity.ForumCommentVO;
import com.asap.forum.entity.PostVO;
import com.asap.forum.entity.SavePostVO;
import com.asap.util.HibernateUtil;


public class ForumCommentDAO implements ForumCommentDAO_interface {
	private SessionFactory factory;

	public ForumCommentDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public Integer add(ForumCommentVO forumComment) {
		return (Integer)getSession().save(forumComment);
		
	}

	@Override
	public Integer update(ForumCommentVO forumComment) {
		try {
			getSession().update(forumComment);
			return 1;
		} catch (Exception e) {
			return -1;
		}
		
	}

	@Override
	public List<ForumCommentVO> getbyPostNo(Integer postno) {
		return getSession().createQuery("from ForumCommentVO where postNo= :postno and cmtStatus=true", ForumCommentVO.class)
				.setParameter("postno", postno)
				.list();
	}
	@Override
	public ForumCommentVO findbyPK(Integer cmtNo) {
		return getSession().get(ForumCommentVO.class, cmtNo);
	}

	
}
