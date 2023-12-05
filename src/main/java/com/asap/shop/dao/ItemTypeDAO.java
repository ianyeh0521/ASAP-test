package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.entity.ItemTypeVO;
import com.asap.util.HibernateUtil;

public class ItemTypeDAO implements ItemTypeDAO_interface {
	private SessionFactory factory;

	public ItemTypeDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(ItemTypeVO itemType) {
		return (Integer) getSession().save(itemType);
	}

	@Override
	public int update(ItemTypeVO itemType) {

		try {
			getSession().update(itemType);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}
	
	@Override
	public int delete(Integer id) {
		ItemTypeVO itemType = getSession().get(ItemTypeVO.class, id);
		if (itemType != null) {
			getSession().delete(itemType);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
	public ItemTypeVO findByItemTypeNo(Integer itemTypeNo) {
		return getSession().get(ItemTypeVO.class, itemTypeNo);
	}

	@Override
	public List<ItemTypeVO> getALL() {
		Transaction transaction = null;
		try {
			Session session = getSession();
			transaction = session.beginTransaction();
			List<ItemTypeVO> list = session.createQuery("from ItemTypeVO", ItemTypeVO.class).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}