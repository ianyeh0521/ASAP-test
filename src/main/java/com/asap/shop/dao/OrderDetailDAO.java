package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.shop.entity.OrderDetailVO;
import com.asap.shop.entity.OrderVO;
import com.asap.util.HibernateUtil;

public class OrderDetailDAO implements OrderDetailDAO_interface {

	private SessionFactory factory;

	public OrderDetailDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(OrderDetailVO orderDetail) {
		// getSession().beginTransaction();
		return (Integer) getSession().save(orderDetail);
		// getSession().getTransaction().commit();
	}

	@Override
	public int update(OrderDetailVO entity) {
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
	public OrderDetailVO findByPK(Integer orderDetailNo) {
		try {
			// getSession().beginTransaction();
			OrderDetailVO vo = getSession().get(OrderDetailVO.class, orderDetailNo);
			// getSession().getTransaction().commit();
			return vo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<OrderDetailVO> findByOrderNo(Integer orderNo) {
		try {
			// getSession().beginTransaction();
			String hql = "FROM OrderDetailVO WHERE orderNo = :orderNo";
			Query<OrderDetailVO> query = getSession().createQuery(hql);
			query.setParameter("orderNo", orderNo);
			List<OrderDetailVO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<OrderDetailVO> findByCmtScore(Integer cmtScore) {
		try {
			// getSession().beginTransaction();
			Query<OrderDetailVO> query = getSession().createQuery("FROM OrderDetailVO WHERE cmtScore = :cmtScore");
			query.setParameter("cmtScore", cmtScore);
			List<OrderDetailVO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<OrderDetailVO> getAll() {
		try {
			// getSession().beginTransaction();
			Query<OrderDetailVO> query = getSession().createQuery("FROM OrderDetailVO", OrderDetailVO.class);
			List<OrderDetailVO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Integer> getAllCmtScore() {
		getSession().beginTransaction();
		Query<Integer> query = getSession().createQuery("SELECT cmtScore FROM OrderDetailVO", Integer.class);
		List<Integer> list = query.list();
		getSession().getTransaction().commit();
		return list;
	}

	@Override
	public Integer getTotal() {
		try {
			getSession().beginTransaction();
			int num = getSession().createQuery("select count(*) from OrderDetailVO", Long.class).uniqueResult()
					.intValue();
			getSession().getTransaction().commit();
			return num;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

}
