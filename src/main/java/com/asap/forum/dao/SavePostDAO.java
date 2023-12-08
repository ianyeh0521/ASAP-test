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
	public Integer delete(Integer sPNo) {
		SavePostVO savepost = getSession().get(SavePostVO.class, sPNo);
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
	
	

}
