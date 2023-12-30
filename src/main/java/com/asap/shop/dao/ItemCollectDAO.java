package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.shop.entity.ItemCollectVO;
import com.asap.util.HibernateUtil;

public class ItemCollectDAO implements ItemCollectDAO_interface {

	private SessionFactory factory;

	public ItemCollectDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public Integer insert(ItemCollectVO entity) {
		try {
			Integer id = (Integer) getSession().save(entity);
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public String delete(ItemCollectVO entity) {
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
	public ItemCollectVO findByPK(Integer itemCollectNo) {
		try {

			ItemCollectVO vo = getSession().get(ItemCollectVO.class, itemCollectNo);

			return vo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ItemCollectVO> findByMbrNo(String mbrNo) {
		try {
			Query<ItemCollectVO> query = getSession().createQuery("FROM ItemCollectVO WHERE mbrNo = :mbrNo",
					ItemCollectVO.class);
			query.setParameter("mbrNo", mbrNo);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ItemCollectVO findByMbrNoAndItemNo(String mbrNo, Integer itemNo) {
		try {
			Query<ItemCollectVO> query = getSession()
					.createQuery("FROM ItemCollectVO WHERE mbrNo = :mbrNo AND itemNo = :itemNo", ItemCollectVO.class);
			query.setParameter("mbrNo", mbrNo);
			query.setParameter("itemNo", itemNo);
			ItemCollectVO vo = query.uniqueResult();
			return vo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ItemCollectVO> getAll() {
		try {
			Query<ItemCollectVO> query = getSession().createQuery("FROM ItemCollectVO", ItemCollectVO.class);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
