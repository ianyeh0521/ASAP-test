package com.asap.forum.dao;

import static com.asap.forum.util.Constants.PAGE_MAX_RESULT;

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

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.forum.entity.PostVO;
import com.asap.util.HibernateUtil;


public class PostDAO implements PostDAO_interface {

	private SessionFactory factory;
	
	public PostDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	
	private Session getSession() {
		return factory.getCurrentSession();
	}
	
//	@Override
//	public List<PostVO> getByCompositeQuery(Map<String, String> map) {
//		// TODO Auto-generated method stub
//		if (map.size()==0)
//			return getAll();
//		CriteriaBuilder builder=getSession().getCriteriaBuilder();
//		CriteriaQuery<PostVO> criteria = builder.createQuery(PostVO.class);
//		Root<PostVO> root = criteria.from(PostVO.class);
//		List<Predicate> predicates = new ArrayList<>();
//		for (Map.Entry<String, String> row : map.entrySet()) {
//			if ("postTitle".equals(row.getKey())) {
//				predicates.add(builder.like(root.get("postTitle"), "%" + row.getValue() + "%"));
//			}
//
//			if ("postTypeNo".equals(row.getKey())) {
//				predicates.add(builder.equal(root.get("postTypeNo"), row.getValue()));
//			}
//
//		}
//		criteria.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
//		criteria.orderBy(builder.asc(root.get("postNo")));
//		TypedQuery<PostVO> query = getSession().createQuery(criteria);
//
//		return query.getResultList();
//
//	}

	@Override
	public List<PostVO> getAll() {
		return getSession().createQuery("from PostVO", PostVO.class).list();
	}

	
	

	@Override
	public Integer addPost(PostVO post) {
		return (Integer)getSession().save(post);	
	}


	@Override
	public Integer delete(Integer postNo) {
		PostVO post = getSession().get(PostVO.class, postNo);
		if (post != null) {
			getSession().delete(post);
			return 1;
		}
		return -1;		
	}



	@Override
	public Integer update(PostVO post) {
		try {
			getSession().update(post);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public List<PostVO> getAllbyDate() {
		return getSession().createQuery("from PostVO where postStatus=1 order by postCrtTime DESC", PostVO.class).list();
	}

	@Override
	public List<PostVO> getbyCategory(Integer posttypeno) {
		return getSession().createQuery("from PostVO where postTypeNo= :posttypeno and postStatus=1 order by postCrtTime DESC", PostVO.class)
		.setParameter("posttypeno", posttypeno)
		.list();
	}

	@Override
	public List<PostVO> getAllbyViews() {
		return getSession().createQuery("from PostVO where postStatus=1 order by postViews DESC", PostVO.class).list();
	}
	
	@Override
	public List<PostVO> getbyPostTitle(String posttitle){
		return getSession().createQuery("from PostVO where postStatus=1 and postTitle like :posttitle order by postCrtTime DESC", PostVO.class)
				.setParameter("posttitle", "%" +posttitle+ "%")
				.list();
	}

	@Override
	public PostVO findbyPK(Integer postNo) {
		return getSession().createQuery("from PostVO where postNo= :postno AND postStatus=1", PostVO.class)
				.setParameter("postno", postNo)
				.uniqueResult();
	}

	@Override
	public List<PostVO> getMyPosts(String mbrNo) {
		return getSession().createQuery("from PostVO where mbrNo= :mbrno AND (postStatus=1 OR postStatus=0)", PostVO.class)
				.setParameter("mbrno", mbrNo)
				.list();
	}

	@Override
	public List<PostVO> getAlltoShow() {
		return getSession().createQuery("from PostVO where postStatus=1", PostVO.class).list();
	};

}
