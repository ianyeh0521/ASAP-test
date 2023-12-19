package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.asap.shop.entity.ItemSizeVO;
import com.asap.util.HibernateUtil;

public class ItemSizeDAO implements ItemSizeDAO_interface {
	private SessionFactory factory;

	public ItemSizeDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(ItemSizeVO itemSize) {
		return (Integer) getSession().save(itemSize);
	}

	
	
	@Override
	public int delete(ItemSizeVO itemSize) {
		
		if (itemSize != null) {
			getSession().delete(itemSize);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
	public ItemSizeVO findByItemSizeNo(Integer itemSizeNo) {
		return getSession().get(ItemSizeVO.class, itemSizeNo);
	}

	@Override
	public List<ItemSizeVO> getALL() {
		Transaction transaction = null;
		try {
			List<ItemSizeVO> list = getSession().createQuery("from ItemSizeVO", ItemSizeVO.class).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}