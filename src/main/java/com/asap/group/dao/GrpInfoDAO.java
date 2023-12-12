package com.asap.group.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.group.entity.GrpInfoVO;
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
	public GrpInfoVO findByGrpNo(Integer id) {
		try {
			String hqlQuery = "FROM GrpInfoVO WHERE GrpNo= :id ";
			Query<GrpInfoVO> query = getSession().createQuery(hqlQuery, GrpInfoVO.class);
			query.setParameter("id", id);
			GrpInfoVO GrpInfo = query.uniqueResult();
			return GrpInfo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<GrpInfoVO> getALL() {
		try {
			return getSession().createQuery("from GrpInfoVO", GrpInfoVO.class).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	// 使用HQL模糊查詢
	public List<GrpInfoVO> getByFuzzySearch(String grpInfoKeyword) {
		String hqlQuery;
		Query<GrpInfoVO> query;
		List<GrpInfoVO> resultList = new ArrayList<>();
		try {
			if (grpInfoKeyword == null || grpInfoKeyword.isEmpty()) {
				hqlQuery = "FROM GrpInfoVO";
				query = getSession().createQuery(hqlQuery, GrpInfoVO.class);
				System.out.println("---------使用HQL模糊查詢-------------GrpInfoVO:" + resultList);
			} else {
				hqlQuery = "FROM GrpInfoVO WHERE " + "GrpName LIKE :keyword OR " + "SportTypeNo LIKE :keyword OR "
						+ "GrpDate LIKE :keyword OR " + "GrpStartTime LIKE :keyword OR "
						+ "GrpEndTime LIKE :keyword OR " + "GrpAddress LIKE :keyword";
				query = getSession().createQuery(hqlQuery, GrpInfoVO.class);
				query.setParameter("keyword", "%" + grpInfoKeyword + "%");
				System.out.println("---------使用HQL模糊查詢-------------grpInfoKeyword:" + grpInfoKeyword);
			}
			resultList = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	// **************(HQL)用某個欄位來找揪團資訊***************
	// column是你要帶入的欄位名稱,Keyword是你欄位的值
	// 小提醒->如果你的Keyword值是String以外的型別請轉成String
	// 成功回傳VO,失敗不會回傳任何資料
	// ************************************************
	@Override
	public List<GrpInfoVO> getQuery(String column, String Keyword) {
		String hqlQuery;
		Query<GrpInfoVO> query;
		List<GrpInfoVO> resultList = new ArrayList<>();
		try {
			if (column == null || column.isEmpty() || Keyword == null || Keyword.isEmpty()) {
				hqlQuery = "FROM GrpInfoVO";
				query = getSession().createQuery(hqlQuery, GrpInfoVO.class);
			} else {
				hqlQuery = "FROM GrpInfoVO WHERE " + column + "= :keyword ";
				query = getSession().createQuery(hqlQuery, GrpInfoVO.class);
				query.setParameter("keyword", Keyword);
			}
			resultList = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	
	
}
