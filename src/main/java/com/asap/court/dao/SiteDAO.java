package com.asap.court.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.loader.plan.build.internal.returns.AbstractEntityReference;
import org.hibernate.query.Query;

import com.asap.court.entity.CourtVO;
import com.asap.court.entity.SiteVO;
import com.asap.util.HibernateUtil;

public class SiteDAO implements SiteDAO_interface{

	private SessionFactory factory;
	
	public SiteDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	
	// Session 為 not thread-safe，所以此方法在各個增刪改查方法裡呼叫
	// 以避免請求執行緒共用了同個 Session
	private Session getSession() {
		return factory.getCurrentSession();
	}
	
	@Override
	public Integer insert(SiteVO siteVO) {
		// 新增成功回傳自增主鍵值，失敗為傳 -1
		try {
			return (Integer) getSession().save(siteVO);
		} catch (Exception e) {
			return -1;
		}
		
	}

	@Override
	public Integer delete(Integer siteNo) {
		SiteVO siteVO = getSession().get(SiteVO.class, siteNo);
		if (siteVO != null) {
			getSession().delete(siteVO);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
	public SiteVO findByPK(Integer siteNo) {
		// 用 PK 找 SiteVO，成功回傳該 SiteVO，失敗回傳 null
		try {
			return getSession().get(SiteVO.class,siteNo);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	

	@Override
	public List<CourtVO> findCourtBySite(Integer siteNo) {
		// 用 siteNo 找 CourtVO，成功回傳 CourtVo List，失敗回傳 null
		try {
			String hql = "from CourtVO ct where ct.siteVO.siteNo = :siteNo";
			Query query = getSession().createQuery(hql);
			query.setParameter("siteNo", siteNo);
			return query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<SiteVO> getAll() {
		// 找全部 SiteVO，成功回傳 SiteVO List，失敗回傳 null
		try {
			return getSession().createQuery("from SiteVO", SiteVO.class).list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}

}
