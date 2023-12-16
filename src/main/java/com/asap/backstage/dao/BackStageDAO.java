package com.asap.backstage.dao;

import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import com.asap.backstage.entity.BackStageVO;
import com.asap.util.HibernateUtil;

public class BackStageDAO implements BackStageDAO_interface {

	private SessionFactory factory;

	public BackStageDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public String add(BackStageVO back) {

		try {
            
			Serializable id = getSession().save(back);
			
			return String.valueOf(id);

		} catch (Exception e) {
			e.printStackTrace();

			return "fail";
		}

	}

	@Override
	public String update(BackStageVO back) {

		try {
//			 getSession().beginTransaction();
			getSession().update(back);
//			getSession().getTransaction().commit();
			return "更新成功";
		} catch (Exception e) {
			e.printStackTrace();

			return "更新失敗";
		}
	}

	@Override
	public BackStageVO findByPK(String backNo) {

		try {
//			 getSession().beginTransaction();
			Query query = getSession().createQuery("from BackStageVO where backNo = :backNo", BackStageVO.class);
			query.setParameter("backNo", backNo);
			BackStageVO back = (BackStageVO) query.uniqueResult();
//			getSession().getTransaction().commit();
			return back;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public BackStageVO findByBackEmail(String backEmail) {
		try {
			Query query = getSession().createQuery("from BackStageVO where backEmail = :backEmail", BackStageVO.class);
			query.setParameter("backEmail", backEmail);
			BackStageVO back = (BackStageVO) query.uniqueResult();
			return back;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public BackStageVO findByBackPhone(String backPhone) {

		try {

			Query query = getSession().createQuery("from BackStageVO where backPhone = :backPhone", BackStageVO.class);
			query.setParameter("backPhone", backPhone);
			BackStageVO back = (BackStageVO) query.uniqueResult();
			return back;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}

	@Override
	public List<BackStageVO> getAll() {
		
		try {
			return getSession().createQuery("from BackStageVO", BackStageVO.class).list();
		} catch (Exception e) {
			e.printStackTrace();
		
			return null;
		}
	}

	@Override
	public int countAll() {
		try {

			int num = getSession().createQuery("select count(*) from BackStageVO", Long.class).uniqueResult()
					.intValue();

			return num;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
//	public static void main(String[] args) {
//		
//		BackStageDAO dao = new BackStageDAO();
//		
//		BackStageVO vo = dao.findByPK("B1203202300002");
//		String string = dao.update(vo);
//		System.out.print(string);
//	}
	
	

}
