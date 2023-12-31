package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.asap.shop.entity.ItemStatVO;
import com.asap.util.HibernateUtil;

public class ItemStatDAO implements ItemStatDAO_interface {
	private SessionFactory factory;

	public ItemStatDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(ItemStatVO itemStat) {
		return (Integer) getSession().save(itemStat);
	}

	@Override
	public int delete(ItemStatVO itemStat) {

		if (itemStat != null) {
			getSession().delete(itemStat);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
	public ItemStatVO findByItemStatNo(Integer itemStatNo) {
		return getSession().get(ItemStatVO.class, itemStatNo);
	}

	@Override
	public List<ItemStatVO> getALL() {
		try {
			List<ItemStatVO> list = getSession().createQuery("from ItemStatVO", ItemStatVO.class).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}