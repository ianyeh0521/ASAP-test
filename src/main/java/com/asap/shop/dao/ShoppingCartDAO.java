package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.shop.entity.ItemCollectVO;
import com.asap.shop.entity.ShoppingCartVO;
import com.asap.util.HibernateUtil;

public class ShoppingCartDAO implements ShoppingCartDAO_interface {

	private SessionFactory factory;

	public ShoppingCartDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public Integer insert(ShoppingCartVO entity) {
		try {
//			getSession().beginTransaction();
			Integer id = (Integer) getSession().save(entity);
//			getSession().getTransaction().commit();
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public Integer update(ShoppingCartVO entity) {
		try {
			// getSession().beginTransaction();
			getSession().update(entity);
			// getSession().getTransaction().commit();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public String delete(ShoppingCartVO entity) {
		try {
			if (entity != null) {
				getSession().delete(entity);
			}

			return "成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "失敗";
		}
	}

	@Override
	public ShoppingCartVO findByPK(Integer shoppingCartNo) {
		try {
			return getSession().get(ShoppingCartVO.class, shoppingCartNo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ShoppingCartVO> findByMember(String mbrNo) {
		try {
			// getSession().beginTransaction();
			Query<ShoppingCartVO> query = getSession().createQuery("FROM ShoppingCartVO WHERE mbrNo = :mbrNo",
					ShoppingCartVO.class);
			query.setParameter("mbrNo", mbrNo);
			// getSession().getTransaction().commit();
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ShoppingCartVO findByMemberAndItemNo(String mbrNo, Integer itemNo) {
		try {
//			getSession().beginTransaction();
			Query<ShoppingCartVO> query = getSession()
					.createQuery("FROM ShoppingCartVO WHERE mbrNo = :mbrNo AND itemNo = :itemNo", ShoppingCartVO.class);
			query.setParameter("mbrNo", mbrNo);
			query.setParameter("itemNo", itemNo);

			ShoppingCartVO vo = query.uniqueResult();
//			getSession().getTransaction().commit();
			return vo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ShoppingCartVO> getAll() {
		try {
			// getSession().beginTransaction();
			Query<ShoppingCartVO> query = getSession().createQuery("FROM ShoppingCartVO", ShoppingCartVO.class);
			// getSession().getTransaction().commit();
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int getTotal() {
		try {
			// getSession().beginTransaction();
			int num = getSession().createQuery("select count(*) from ShoppingCartVO", Long.class).uniqueResult()
					.intValue();
			// getSession().getTransaction().commit();
			return num;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

}
