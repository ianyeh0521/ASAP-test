package com.asap.group.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.asap.group.entity.GrpInfoVO;
import com.asap.group.entity.SportTypeVO;
import com.asap.util.HibernateUtil;

public class GrpInfoDAO implements GrpInfoDAO_interface {

	private SessionFactory factory;

	public GrpInfoDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(GrpInfoVO grpInfo) {

		return (Integer) getSession().save(grpInfo);
	}

	@Override
	public int update(GrpInfoVO grpInfo) {

		try {
			getSession().update(grpInfo);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int delete(Integer id) {
		GrpInfoVO grpInfo = getSession().get(GrpInfoVO.class, id);
		if (grpInfo != null) {
			getSession().delete(grpInfo);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
//	 揪團編號查找單筆揪團資訊
	public List<GrpInfoVO> findByGrpNo(Integer id) {
//		System.out.println("----------TEST---------  findByGrpNo");
//		List<GrpInfoVO> List = (List<GrpInfoVO>) getSession().get(GrpInfoVO.class, id);
//		System.out.println("----------TEST---------  List");
//		return List;
		System.out.println("----------TEST---------  findByGrpNo");
		String hqlQuery;
		Query query;
		Transaction transaction = null;
		List<GrpInfoVO> resultList = new ArrayList<>();
		try (Session session = getSession()){
			//Session session = getSession();
			transaction = session.beginTransaction();

				hqlQuery = "FROM GrpInfoVO WHERE GrpNo= :id ";
				query = session.createQuery(hqlQuery);
				query.setParameter("id", id);

			resultList = query.getResultList();
			return resultList;
		} catch (Exception e) {
			if (transaction != null) {
	            transaction.rollback();
	        }
			e.printStackTrace();
		}
		return null;
		
	}

	@Override
	public List<GrpInfoVO> getALL() {
		Transaction transaction = null;
		try (Session session = getSession()){
			//Session session = getSession();
			transaction = session.beginTransaction();
			List<GrpInfoVO> list = session.createQuery("from GrpInfoVO", GrpInfoVO.class).list();

			
			transaction.commit();
			return list;
		} catch (Exception e) {
			if (transaction != null) {
	            transaction.rollback();
	        }
			e.printStackTrace();
		}
		return null;
	}

	@Override
	// 使用HQL模糊查詢
	public List<GrpInfoVO> getByFuzzySearch(String grpInfoKeyword) {
		String hqlQuery;
		Query query;
		List<GrpInfoVO> resultList = new ArrayList<>();
		Transaction transaction = null;
		try (Session session = getSession()) {
			//Session session = getSession();
			transaction = session.beginTransaction();
			if (grpInfoKeyword == null || grpInfoKeyword.isEmpty()) {
				hqlQuery = "FROM GrpInfoVO";
				query = session.createQuery(hqlQuery);
			} else {
				hqlQuery = "FROM GrpInfoVO WHERE " + "GrpName LIKE :keyword OR " + "SportTypeNo LIKE :keyword OR "
						+ "GrpDate LIKE :keyword OR " + "GrpStartTime LIKE :keyword OR "
						+ "GrpEndTime LIKE :keyword OR " + "GrpAddress LIKE :keyword";
				query = session.createQuery(hqlQuery);
				query.setParameter("keyword", "%" + grpInfoKeyword + "%");
			}
			resultList = query.getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
	            transaction.rollback();
	        }
			e.printStackTrace();
		}
		return resultList;
	}

	//**********************(HQL)用某個欄位來找揪團資訊****************************
	// 	column是你要帶入的欄位名稱,Keyword是你欄位的值
	// 	小提醒->如果你的Keyword值是String以外的型別請轉成String
	// 	成功回傳VO,失敗不會回傳任何資料;可參考TestGrpInfoVO.java測試
	//*********************************************************************
	@Override
	public List<GrpInfoVO> getQuery(String column, String Keyword) {
		String hqlQuery;
		Query query;
		List<GrpInfoVO> resultList = new ArrayList<>();
		Transaction transaction = null;
		try (Session session = getSession()){
			//Session session = getSession();
			transaction = session.beginTransaction();
			if (column == null || column.isEmpty() || Keyword == null || Keyword.isEmpty()) {

				hqlQuery = "FROM GrpInfoVO";
				query = session.createQuery(hqlQuery);
			} else {
				hqlQuery = "FROM GrpInfoVO WHERE " + column + "= :keyword ";
				query = session.createQuery(hqlQuery);
				query.setParameter("keyword", Keyword);
			}

			resultList = query.getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
	            transaction.rollback();
	        }
			e.printStackTrace();
		}
		return resultList;
	}

}
