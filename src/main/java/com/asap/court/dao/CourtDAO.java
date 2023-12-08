package com.asap.court.dao;

import static com.asap.util.Constants.PAGE_MAX_RESULT;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transaction;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.court.entity.CourtImgVO;
import com.asap.court.entity.CourtVO;
import com.asap.util.HibernateUtil;

public class CourtDAO implements CourtDAO_interface {
	// SessionFactory 為 thread-safe，可宣告為屬性讓請求執行緒們共用
	private SessionFactory factory;

	public CourtDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	// Session 為 not thread-safe，所以此方法在各個增刪改查方法裡呼叫
	// 以避免請求執行緒共用了同個 Session
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(CourtVO entity) {
		// 新增成功回傳自增主鍵值，失敗回傳 -1
		try {
			entity.toString();
			return (Integer) getSession().save(entity);
		} catch (Exception e) {
			return -1;
		}
		
	}

	@Override
	public int update(CourtVO entity) {
		//	成功更新回傳 1，失敗回傳 -1
		try {
			CourtVO courtUpdate = new CourtVO();
			courtUpdate.setCourtNo(entity.getCourtNo());
			courtUpdate.setCourtName(entity.getCourtName());
			courtUpdate.setCourtAddress(entity.getCourtAddress());
			courtUpdate.setCourtLat(entity.getCourtLat());
			courtUpdate.setCourtLong(entity.getCourtLong());
			courtUpdate.setCourtPplLimit(entity.getCourtPplLimit());
			courtUpdate.setCourtPrice(entity.getCourtPrice());
			courtUpdate.setCourtStat(entity.getCourtStat());
			courtUpdate.setCourtText(entity.getCourtText());
			courtUpdate.setCourtTypeVO(entity.getCourtTypeVO());
			courtUpdate.setSiteVO(entity.getSiteVO());
			courtUpdate.setIndoor(entity.getIndoor());
			getSession().update(courtUpdate);
			return 1;
		} catch (Exception e) {
			return -1;
		}
		
	}

	@Override
	public int delete(Integer id) {
		CourtVO courtVO = getSession().get(CourtVO.class, id);
		if (courtVO != null) {
			getSession().delete(courtVO);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
	public CourtVO getById(Integer id) {
		// 以 PK 來找 CourtVO，成功回傳該 VO，失敗回傳 null
		try {
			return getSession().get(CourtVO.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CourtVO> getAll() {
		// 取得全部的 CourtVO List，成功回傳 List，失敗回傳空值
		try {
			return getSession().createQuery("from CourtVO", CourtVO.class).list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CourtVO> getByCompositeQuery(Map<String, String> map) {
		if (map.size() == 0)
			return getAll();

		CriteriaBuilder builder = getSession().getCriteriaBuilder();
		CriteriaQuery<CourtVO> criteria = builder.createQuery(CourtVO.class);
		Root<CourtVO> root = criteria.from(CourtVO.class);

		List<Predicate> predicates = new ArrayList<>();


		for (Map.Entry<String, String> row : map.entrySet()) {
			// 用名稱模糊比對查詢
			if ("searchCourt".equals(row.getKey()) && !(row.getValue().equals(""))) {
				predicates.add(builder.like(root.get("courtName"), "%" + row.getValue() + "%"));
			}
			// 用場地類別查詢
			if ("courtType".equals(row.getKey()) && !(row.getValue().equals(""))) {
				System.out.println(row.getValue());
				predicates.add(builder.equal(root.get("courtTypeVO").get("courtTypeNo"), row.getValue()));
			}
			// 用地點編號（地區）查詢
			if ("regions".equals(row.getKey()) && !(row.getValue().equals(""))) {
				System.out.println(row.getValue());
				predicates.add(builder.equal(root.get("siteVO").get("siteNo"), row.getValue()));
			}
		}

		criteria.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
//		criteria.orderBy(builder.asc(root.get("courtNo")));
		TypedQuery<CourtVO> query = getSession().createQuery(criteria);

		return query.getResultList();
	}

	@Override
	public List<CourtVO> getAll(int currentPage) {
		int first = (currentPage - 1) * PAGE_MAX_RESULT;
		return getSession().createQuery("from CourtVO", CourtVO.class).setFirstResult(first)
				.setMaxResults(PAGE_MAX_RESULT).list();
	}

	@Override
	public long getTotal() {
		return getSession().createQuery("select count(*) from CourtVO", Long.class).uniqueResult();
	}

	@Override
	public List<CourtVO> getCourtsByName(String name) {
		String hql = "from CourtVO ct where ct.courtName LIKE :getname";
		Query query = getSession().createQuery(hql);
		query.setParameter("getname", "%" + name + "%");
		return query.list();
//		return getSession().createQuery("hql", CourtVO.class).list();
	}
	 
	

}
