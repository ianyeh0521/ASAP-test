package com.asap.member.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.member.entity.MbrNewsVO;
import com.asap.util.HibernateUtil;

public class MbrNewsDAO implements MbrNewsDAO_interface{
	
	private SessionFactory factory;

	public MbrNewsDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int add(MbrNewsVO mbrNews) {
		try {
			
			Integer id = (Integer) getSession().save(mbrNews);
          
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public String delete(MbrNewsVO mbrNews) {
		try {

			if (mbrNews != null) {
				getSession().delete(mbrNews);
			}
			return "成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "失敗";
		}
	}

	@Override
	public List<MbrNewsVO> findByMbrNo(String mbrNo) {
		try {
			Query<MbrNewsVO> query = getSession().createQuery("from MbrNewsVO where mbrNo = :mbrNo order by newsTime desc",
					MbrNewsVO.class);
			query.setParameter("mbrNo", mbrNo);
			List<MbrNewsVO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public MbrNewsVO findByPK(Integer mbrNewsNo) {
		try {
			Query<MbrNewsVO> query = getSession().createQuery("from MbrNewsVO where mbrNewsNo = :mbrNewsNo",
					MbrNewsVO.class);
			query.setParameter("mbrNewsNo", mbrNewsNo);
			MbrNewsVO vo = query.uniqueResult();
			return vo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	

}
