package com.asap.forum.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.asap.forum.entity.PostVO;
import com.asap.forum.entity.SavePostVO;
import com.asap.util.HibernateUtil;



public class SavePostDAO implements SavePostDAO_interface{

	private SessionFactory factory;

	public SavePostDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public Integer add(SavePostVO savepost) {
		return (Integer)getSession().save(savepost);
	}


	@Override
	public Integer delete(String mbrNo, Integer postNo) {
		SavePostVO savepost = getSession().createQuery("from SavePostVO where mbrNo= :mbrNo AND postNo= :postNo", SavePostVO.class)
								.setParameter("mbrNo", mbrNo)
								.setParameter("postNo", postNo)			
								.uniqueResult();
		if (savepost != null) {
			getSession().delete(savepost);
			return 1;
		}
		return -1;		
	}


	@Override
	public List<SavePostVO> getbyMbrNo(String mbrNo) {
		return getSession().createQuery("from SavePostVO where mbrNo= :mbrno", SavePostVO.class)
				.setParameter("mbrno", mbrNo)
				.list();
	}

	@Override
	public List<SavePostVO> getAll() {
		return getSession().createQuery("from SavePostVO", SavePostVO.class).list();
	}
	
	

}
