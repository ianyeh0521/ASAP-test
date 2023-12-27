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
		
		int updatedgrpInfo = 0;
		try {			
			if(grpInfo.getGrpStat() == 1) {
				Query query;
				String hql = "UPDATE GrpInfoVO SET GrpStat = :newGrpStat WHERE GrpNo = :grpNo";
				query = getSession().createQuery(hql);
				query.setParameter("newGrpStat", grpInfo.getGrpStat());
				query.setParameter("grpNo", grpInfo.getGrpNo());
				updatedgrpInfo = query.executeUpdate();
			}
			else {
				Query query;
				String hql = "UPDATE GrpInfoVO SET "
				        + "OrgMbrNo = :orgMbrNo, "
				        + "SportTypeNo = :sportTypeNo, "
				        + "GrpName = :grpName, "
				        + "GrpDate = :grpDate, "
				        + "GrpStartTime = :grpStartTime, "
				        + "GrpEndTime = :grpEndTime, "
				        + "GrpAddress = :grpAddress, "
				        + "GrpPplLimit = :grpPplLimit, "
				        + "GrpPplMin = :grpPplMin, "
				        + "GrpSignStrTime = :grpSignStrTime, "
				        + "GrpSignEndTime = :grpSignEndTime, "
				        + "GrpNote = :grpNote, "
				        + "GrpImg = :grpImg "
				        + "WHERE GrpNo = :grpNo";
				query = getSession().createQuery(hql);
				query.setParameter("orgMbrNo", grpInfo.getOrgMbrNo());
				query.setParameter("sportTypeNo", grpInfo.getSportTypeNo());
				query.setParameter("grpName", grpInfo.getGrpName());
				query.setParameter("grpDate", grpInfo.getGrpDate());
				query.setParameter("grpStartTime", grpInfo.getGrpStartTime());
				query.setParameter("grpEndTime", grpInfo.getGrpEndTime());
				query.setParameter("grpAddress", grpInfo.getGrpAddress());
				query.setParameter("grpPplLimit", grpInfo.getGrpPplLimit());
				query.setParameter("grpPplMin", grpInfo.getGrpPplMin());
				query.setParameter("grpSignStrTime", grpInfo.getGrpSignStrTime());
				query.setParameter("grpSignEndTime", grpInfo.getGrpSignEndTime());
				query.setParameter("grpNote", grpInfo.getGrpNote());
				query.setParameter("grpImg", grpInfo.getGrpImg());
				query.setParameter("grpNo", grpInfo.getGrpNo());
				updatedgrpInfo = query.executeUpdate();
			}
					    
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updatedgrpInfo;
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
			} else {
				hqlQuery = "FROM GrpInfoVO WHERE " + "GrpName LIKE :keyword OR " + "SportTypeNo LIKE :keyword OR "
						+ "GrpDate LIKE :keyword OR " + "GrpStartTime LIKE :keyword OR "
						+ "GrpEndTime LIKE :keyword OR " + "GrpAddress LIKE :keyword";
				query = getSession().createQuery(hqlQuery, GrpInfoVO.class);
				query.setParameter("keyword", "%" + grpInfoKeyword + "%");
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
