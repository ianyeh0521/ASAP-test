package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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
		return (Integer) getSession().save(itemImg);
	}

	@Override
	public int update(ItemImgVO itemImg) {

		try {
			getSession().update(itemImg);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}
	
	@Override
	public int delete(Integer id) {
		ItemImgVO itemImg = getSession().get(ItemImgVO.class, id);
		if (itemImg != null) {
			getSession().delete(itemImg);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
	public ItemImgVO findByItemImgNo(Integer itemImgNo) {
		return getSession().get(ItemImgVO.class, itemImgNo);
	}

	@Override
	public List<ItemImgVO> getALL() {
		Transaction transaction = null;
		try {
			Session session = getSession();
			transaction = session.beginTransaction();
			List<ItemImgVO> list = session.createQuery("from ItemImgVO", ItemImgVO.class).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
