package com.asap.group.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.asap.group.entity.GrpInfoVO;
import com.asap.group.entity.GrpJoinInfoVO;
import com.asap.util.HibernateUtil;

public class GrpJoinInfoDAO implements GrpJoinInfoDAO_interface {

	private SessionFactory factory;

	public GrpJoinInfoDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(GrpJoinInfoVO grpJoinInfo) {
		return (Integer) getSession().save(grpJoinInfo);
	}

	@Override
	public int update(GrpJoinInfoVO grpJoinInfo) {
		Query query;
		int updatedEntities = 0;
		try {			
			String hql = "UPDATE GrpJoinInfoVO SET GrpJoinStat = :newGrpJoinStat WHERE PartiMbrNo = :partiMbrNo AND GrpNo = :grpNo";
			query = getSession().createQuery(hql);
			query.setParameter("newGrpJoinStat", grpJoinInfo.getGrpJoinStat());
			query.setParameter("partiMbrNo", "M1206202300002");
			query.setParameter("grpNo", grpJoinInfo.getGrpNo());

			updatedEntities = query.executeUpdate();
					    
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updatedEntities;
	}
	@Override
	public int delete(Integer id) {
		GrpInfoVO grpJoinInfo = getSession().get(GrpInfoVO.class, id);
		if (grpJoinInfo != null) {
			getSession().delete(grpJoinInfo);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
	public GrpJoinInfoVO findByGrpJoinInfoNo(Integer id) {
		try {
			GrpJoinInfoVO grpJoinInfo = getSession().get(GrpJoinInfoVO.class, id);
			return grpJoinInfo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<GrpJoinInfoVO> getALL() {
		try {
			return getSession().createQuery("from GrpJoinInfoVO", GrpJoinInfoVO.class).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// **************(HQL)用某個欄位來找揪團資訊***************
	// column是你要帶入的欄位名稱,Keyword是你欄位的值
	// 小提醒->如果你的Keyword值是String以外的型別請轉成String
	// 成功回傳VO,失敗不會回傳任何資料
	// ************************************************
	@Override
	public List<GrpJoinInfoVO> getGrpJoinQuery(String column, String Keyword) {
		String hqlQuery;
		Query <GrpJoinInfoVO> query;
		List<GrpJoinInfoVO> resultList = new ArrayList<>();
		try {
			if (column == null || column.isEmpty() || Keyword == null || Keyword.isEmpty()) {
				hqlQuery = "FROM GrpJoinInfoVO";
				query = getSession().createQuery(hqlQuery, GrpJoinInfoVO.class);
			} else {
				hqlQuery = "FROM GrpJoinInfoVO WHERE " + column + "= :keyword ";
				query = getSession().createQuery(hqlQuery, GrpJoinInfoVO.class);
				query.setParameter("keyword", Keyword);
			}
			resultList = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

}
