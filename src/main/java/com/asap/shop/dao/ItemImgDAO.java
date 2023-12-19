package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.asap.shop.entity.ItemImgVO;
import com.asap.util.HibernateUtil;

public class ItemImgDAO implements ItemImgDAO_interface {
	private SessionFactory factory;

	public ItemImgDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(ItemImgVO itemImg) {
		try {
			return (Integer) getSession().save(itemImg);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

	@Override
	public int delete(ItemImgVO itemImg) {
		try {
			if (itemImg != null) {
				getSession().delete(itemImg);
				// 回傳給 service，1代表刪除成功
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

	@Override
	public ItemImgVO findByPK(Integer itemImgNo) {
		try {
			return getSession().get(ItemImgVO.class, itemImgNo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ItemImgVO> getALL() {
		Transaction transaction = null;
		try {

			List<ItemImgVO> list = getSession().createQuery("from ItemImgVO", ItemImgVO.class).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<ItemImgVO> findByItemNo(Integer itemNo) {
		try {
			String hql = "FROM ItemImgVO WHERE itemNo = :itemNo";
			Query<ItemImgVO> query = getSession().createQuery(hql, ItemImgVO.class);
			query.setParameter("itemNo", itemNo);
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
//		return null;
	}

}
