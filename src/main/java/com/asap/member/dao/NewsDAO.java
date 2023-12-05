package com.asap.member.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.member.entity.NewsVO;
import com.asap.util.HibernateUtil;

public class NewsDAO implements NewsDAO_interface {

	private SessionFactory factory;

	public NewsDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int add(NewsVO news) {
		try {

			Integer id = (Integer) getSession().save(news);

			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public String delete(NewsVO news) {
		try {

			if (news != null) {
				getSession().delete(news);
			}
			return "成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "失敗";
		}
	}

	@Override
	public NewsVO findByPK(int newsNo) {
		try {
			NewsVO news = getSession().get(NewsVO.class, newsNo);
			return news;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<NewsVO> findByNewsSubj(String keyword) {
		try {

			Query<NewsVO> query = getSession().createQuery("from NewsVO where newsSubj like :newsSubj", NewsVO.class);
			query.setParameter("newsSubj", "%" + keyword + "%");
			List<NewsVO> list = query.list();

			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<NewsVO> findByNewsText(String keyword) {
		try {

			Query<NewsVO> query = getSession().createQuery("from NewsVO where newsText like :newsText", NewsVO.class);
			query.setParameter("newsText", "%" + keyword + "%");
			List<NewsVO> list = query.list();

			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
