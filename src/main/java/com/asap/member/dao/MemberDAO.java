package com.asap.member.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.member.entity.MemberVO;
import com.asap.util.HibernateUtil;

public class MemberDAO implements MemberDAO_interface {

	private SessionFactory factory;

	public MemberDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public String add(MemberVO mem) {
		try {

			Serializable id = getSession().save(mem);

			return String.valueOf(id);

		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}

	}

	@Override
	public String update(MemberVO mem) {
		try {

			getSession().update(mem);

			return "更新成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "更新失敗";
		}
	}

	@Override
	public List<MemberVO> getAll() {
		try {
			return getSession().createQuery("from MemberVO", MemberVO.class).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public MemberVO findByPK(String mbrNo) {
		try {
			Query<MemberVO> query = getSession().createQuery("from MemberVO where mbrNo = :mbrNo", MemberVO.class);
			query.setParameter("mbrNo", mbrNo);
			MemberVO mem = query.uniqueResult();
			return mem;
			// 沒有該資料會返回null
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public MemberVO findByMbrEmail(String mbrEmail) {

		try {
			Query<MemberVO> query = getSession().createQuery("from MemberVO where mbrEmail = :MbrEmail",
					MemberVO.class);
			query.setParameter("MbrEmail", mbrEmail);
			MemberVO mem = (MemberVO) query.uniqueResult();
			return mem;
			// 沒有該資料會返回null
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public MemberVO findByMbrPhone(String mbrPhone) {
		try {
			Query<MemberVO> query = getSession().createQuery("from MemberVO where mbrPhone = :MbrPhone",
					MemberVO.class);
			query.setParameter("MbrPhone", mbrPhone);
			MemberVO mem = (MemberVO) query.uniqueResult();
			return mem;
			// 沒有該資料會返回null
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int countAll() {
		try {

			int num = getSession().createQuery("select count(*) from MemberVO", Long.class).uniqueResult().intValue();

			return num;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

}
