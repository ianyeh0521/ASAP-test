package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.forum.entity.PostVO;
import com.asap.shop.entity.OrderVO;
import com.asap.util.HibernateUtil;

public class OrderDAO implements OrderDAO_interface {

	private SessionFactory factory;

	public OrderDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(OrderVO entity) {
		try {
			// getSession().beginTransaction();
			Integer id = (Integer) getSession().save(entity);
			// getSession().getTransaction().commit();
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public int update(OrderVO entity) {
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

	public int delete(OrderVO entity) {
		try {
			if (entity != null) {
				getSession().delete(entity);
				// 回傳給 service，1代表刪除成功
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public OrderVO findByPK(Integer orderNo) {
		try {
			// getSession().beginTransaction();
			OrderVO vo = getSession().get(OrderVO.class, orderNo);
			// getSession().getTransaction().commit();
			return vo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<OrderVO> findByMbrNo(String mbrNo) {
		try {
			// getSession().beginTransaction();
			Query<OrderVO> query = getSession().createQuery("FROM OrderVO WHERE mbrNo = :mbrNo", OrderVO.class);
			query.setParameter("mbrNo", mbrNo);
			List<OrderVO> list = query.list();
			// getSession().getTransaction().commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<OrderVO> findByOrderStat(Integer orderStat) {
		try {
			// getSession().beginTransaction();
			Query<OrderVO> query = getSession().createQuery("FROM OrderVO WHERE orderStat = :orderStat", OrderVO.class);
			query.setParameter("orderStat", orderStat);
			List<OrderVO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<OrderVO> getAll() {
		try {
			// getSession().beginTransaction();
			Query<OrderVO> query = getSession().createQuery("FROM OrderVO", OrderVO.class);
			List<OrderVO> list = query.list();
			// getSession().getTransaction().commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int getTotal() {
		try {
			// getSession().beginTransaction();
			int num = getSession().createQuery("select count(*) from OrderVO", Long.class).uniqueResult().intValue();
			// getSession().getTransaction().commit();
			return num;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public List<OrderVO> findUnPaid(String mbrNo) {
		return getSession().createQuery("from OrderVO where mbrNo= :mbrNo and orderStat=0", OrderVO.class)
				.setParameter("mbrNo", mbrNo).list();
	}

	@Override
	public List<OrderVO> checkUnpaid() {
		Session session = factory.openSession();
		try {
			List<OrderVO> list = session.createQuery("from OrderVO where orderStat=0", OrderVO.class).list();
			return list;
		} finally {
			if (session != null) {
				session.close();
				System.out.println("session is closed");
			}
		}
	}

	@Override
	public Integer checkerUpdate(OrderVO entity) {
		Session session = factory.openSession();
		try {
			session.beginTransaction();
			session.update(entity);
			session.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			
			return -1;
		}finally {
			if (session != null) {
				session.close();
				System.out.println("session is closed");
			}
		}
	}

}
