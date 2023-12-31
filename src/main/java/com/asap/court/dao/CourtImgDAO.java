package com.asap.court.dao;

import java.util.Collections;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.court.entity.CourtImgVO;
import com.asap.court.entity.CourtVO;
import com.asap.util.HibernateUtil;

public class CourtImgDAO implements CourtImgDAO_interface {

	private SessionFactory factory;
	
	public CourtImgDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	
	private Session getSession() {
		return factory.getCurrentSession();
	}
	
	@Override
	public int insert(CourtImgVO courtImgVO) {
		// 新增成功回傳自增主鍵值，失敗回傳 -1
		try {
			return (Integer) getSession().save(courtImgVO);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
			
		}
		
	}


	@Override
	public int update(CourtImgVO courtimgVO) {
		try {
			CourtImgVO courtImgUpdate = (CourtImgVO) getSession().get(CourtImgVO.class,courtimgVO.getCourtImgNo());
			if(courtImgUpdate != null) {
				courtImgUpdate.setCourtImg(courtimgVO.getCourtImg());
				courtImgUpdate.setCourtImgNo(courtimgVO.getCourtImgNo());
				courtImgUpdate.setCourtVO(courtimgVO.getCourtVO());
			}
			getSession().update(courtImgUpdate);
			return 1;
		}catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int delete(Integer courtImgNo) {
		CourtImgVO courtImgVO = getSession().get(CourtImgVO.class, courtImgNo);
		if (courtImgVO != null) {
			getSession().delete(courtImgVO);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
	public CourtImgVO findByPK(Integer courtImgNo) {
		// 用 PK 找 CourtImgVO，成功回傳該 CourtImgVO，失敗回傳 null
		try {
			return getSession().get(CourtImgVO.class, courtImgNo);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CourtImgVO> findByCourtNo(Integer courtNo) {
		// 用 courtNo 找 CourtImgVO，成功回傳 CourtImgVO List，失敗回傳 null
		try {
			String hql = "from CourtImgVO cimg where cimg.courtVO.courtNo = :courtNo";
			Query query = getSession().createQuery(hql);
			query.setParameter("courtNo", courtNo);
			return query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public List<CourtImgVO> getAll() {
		// 找全部的 CourtImgVO，成功回傳 CourtImgVO List，失敗回傳 null
		try {
			return getSession().createQuery("from CourtImgVO", CourtImgVO.class).list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CourtImgVO> getAll(int page, int itemsPerPage) {
		try {
            CriteriaBuilder builder = getSession().getCriteriaBuilder();
            CriteriaQuery<CourtImgVO> criteriaQuery = builder.createQuery(CourtImgVO.class);
            Root<CourtImgVO> root = criteriaQuery.from(CourtImgVO.class);

            // Implement pagination logic
            int startIndex = (page - 1) * itemsPerPage;

            List<CourtImgVO> result = getSession().createQuery(criteriaQuery)
                    .setFirstResult(startIndex)
                    .setMaxResults(itemsPerPage)
                    .getResultList();

            return result;
        } catch (HibernateException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
	
}
