package com.asap.member.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.member.entity.MbrActivVO;
import com.asap.util.HibernateUtil;

public class MbrActivDAO implements MbrActivDAO_interface{
	
	private SessionFactory factory;

	public MbrActivDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int add(MbrActivVO mbrActiv) {
		try {

			Integer id = (Integer) getSession().save(mbrActiv);
           
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public String delete(MbrActivVO mbrActiv) {
		try {

			if (mbrActiv != null) {
				getSession().delete(mbrActiv);
			}
			return "成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "失敗";
		}
	}

	@Override
	public List<MbrActivVO> findByMbrNo(String mbrNo) {
		try {
			Query<MbrActivVO> query = getSession().createQuery("from MbrActivVO where mbrNo = :mbrNo",
					MbrActivVO.class);
			query.setParameter("mbrNo", mbrNo);
			List<MbrActivVO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public MbrActivVO findByPK(String mbrActivNo) {
		try {
			Query<MbrActivVO> query = getSession().createQuery("from MbrActivVO where mbrActivNo = :mbrActivNo",
					MbrActivVO.class);
			query.setParameter("mbrActivNo", mbrActivNo);
			MbrActivVO vo = query.uniqueResult();
			return vo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
}
