package com.asap.backstage.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.asap.backstage.entity.BackAccessTypeVO;
import com.asap.util.HibernateUtil;

public class BackAccessTypeDAO implements BackAccessTypeDAO_interface {

	private SessionFactory factory;

	public BackAccessTypeDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();

	}



	@Override
	public int add(BackAccessTypeVO backType) {
		try {
			Integer id = (Integer) getSession().save(backType);
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}

	@Override
	public String update(BackAccessTypeVO backType) {
		try {
			getSession().update(backType);
			return "更新成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "更新失敗";
		}
		
	}

	@Override
	public BackAccessTypeVO findByPK(int backTypeNo) {
		try {
			BackAccessTypeVO bTypeVO = getSession().get(BackAccessTypeVO.class, backTypeNo);
			return bTypeVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		

	}

	@Override
	public List<BackAccessTypeVO> getAll() {
		try {
			return getSession().createQuery("from BackAccessTypeVO", BackAccessTypeVO.class).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			
		}
		
	}

	@Override
	public int countAll() {
		try {

			int num = getSession().createQuery("select count(*) from BackAccessTypeVO", Long.class).uniqueResult()
					.intValue();

			return num;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}

}
