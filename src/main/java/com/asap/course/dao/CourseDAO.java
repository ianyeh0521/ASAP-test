package com.asap.course.dao;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.course.entity.CourseVO;
import com.asap.court.entity.CourtVO;
import com.asap.util.HibernateUtil;

public class CourseDAO implements CourseDAO_interface{

	private static final int PAGE_MAX_RESULT = 5;
	private SessionFactory factory;
	
	public CourseDAO() {
		factory = HibernateUtil.getSessionFactory();
	}
	
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int update(CourseVO courseVO) {
		// 成功更新回傳 1，失敗回傳 -1
		try {
			CourseVO courseUpdate = new CourseVO();
			courseUpdate.setCourseNo(courseVO.getCourseNo());
			courseUpdate.setCoachVO(courseVO.getCoachVO());
			courseUpdate.setCourseAddress(courseVO.getCourseAddress());
			courseUpdate.setCourseImg(courseVO.getCourseImg());
			courseUpdate.setCourseName(courseVO.getCourseName());
			courseUpdate.setCoursePplLimit(courseVO.getCoursePplLimit());
			courseUpdate.setCoursePrice(courseVO.getCoursePrice());
			courseUpdate.setCourseStat(courseVO.getCourseStat());
			courseUpdate.setCourseText(courseVO.getCourseText());
			courseUpdate.setCourseStartTime(courseVO.getCourseStartTime());
			courseUpdate.setCourseEndTime(courseVO.getCourseEndTime());
			courseUpdate.setSportTypeVO(courseVO.getSportTypeVO());
			getSession().update(courseUpdate);
			return 1;
		} catch (Exception e) {
			return -1;
		}
		
	}

	@Override
	public int insert(CourseVO courseVO) {
		// 新增成功回傳自增主鍵值，失敗回傳 -1
		try {
			courseVO.toString();
			return (Integer) getSession().save(courseVO);
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int delete(Integer courseNo) {
		CourseVO courseVO = getSession().get(CourseVO.class, courseNo);
		if (courseVO != null) {
			getSession().delete(courseVO);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
		
	}

	@Override
	public CourseVO findByPK(Integer courseNo) {
		// 以 PK 來找 CourseVO，成功回傳該 VO，失敗回傳 null
		try {
			return getSession().get(CourseVO.class, courseNo);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CourseVO> findByName(String courseName) {
		String hql = "from CourseVO cs where cs.courseName LIKE :getname";
		Query query = getSession().createQuery(hql);
		query.setParameter("getname", "%" + courseName + "%");
		return query.list();
	}

	@Override
	public List<CourseVO> findByCoach(String coachNo) {
		String hql = "from CourseVO cs where cs.coachVO.coachNo = :getno";
		Query query = getSession().createQuery(hql);
		query.setParameter("getno",coachNo);
		return query.list();
	}

//	@Override
//	public List<CourseVO> findBySportType(Integer sportTypeNo) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public List<CourseVO> getByCompositeQuery(Map<String, String> map) {
		if (map.size() == 0)
			return getAll();

		CriteriaBuilder builder = getSession().getCriteriaBuilder();
		CriteriaQuery<CourseVO> criteria = builder.createQuery(CourseVO.class);
		Root<CourseVO> root = criteria.from(CourseVO.class);

		List<Predicate> predicates = new ArrayList<>();

		if (map.containsKey("startTime") && map.containsKey("endTime"))
			predicates.add(builder.between(root.get("courseTime"), Timestamp.valueOf(map.get("startTime")), Timestamp.valueOf(map.get("endTime"))));

		for (Map.Entry<String, String> row : map.entrySet()) {
			if ("courseSearch".equals(row.getKey())) {
				predicates.add(builder.like(root.get("courseName"), "%" + row.getValue() + "%"));
			}

			if ("startTime".equals(row.getKey())) {
				if (!map.containsKey("endTime"))
					predicates.add(builder.greaterThanOrEqualTo(root.get("courseTime"), Timestamp.valueOf(row.getValue())));
			}

			if ("endTime".equals(row.getKey())) {
				if (!map.containsKey("startTime"))
					predicates.add(builder.lessThanOrEqualTo(root.get("courseTime"), Timestamp.valueOf(row.getValue())));
			}
			
			if ("sportType".equals(row.getKey())) {
				predicates.add(builder.equal(root.get("sportTypeVO").get("sportTypeNo"), row.getValue()));
			}
			
			if ("site".equals(row.getKey())) {
				predicates.add(builder.like(root.get("courseAddress"), "%" + row.getValue() + "%"));
			}

		}

		criteria.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
//		criteria.orderBy(builder.asc(root.get("courseNo")));
		TypedQuery<CourseVO> query = getSession().createQuery(criteria);

		return query.getResultList();
	}

	@Override
	public List<CourseVO> getAll() {
		// 取得全部的 CourseVO List，成功回傳 List，失敗回傳空值
		try {
			return getSession().createQuery("from CourseVO", CourseVO.class).list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CourseVO> getAll(int currentPage) {
		int first = (currentPage - 1) * PAGE_MAX_RESULT;
		return getSession().createQuery("from CourseVO cr where cr.courseEndTime > CURRENT_TIMESTAMP", CourseVO.class).setFirstResult(first)
				.setMaxResults(PAGE_MAX_RESULT).list();
	}

	@Override
	public long getTotal() {
		return getSession().createQuery("select count(*) from CourseVO cr where cr.courseEndTime > CURRENT_TIMESTAMP", Long.class).uniqueResult();
	}
	
	
	
	
}
