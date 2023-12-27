package com.asap.course.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.asap.course.dao.CourseDAO;
import com.asap.course.dao.CourseDAO_interface;
import com.asap.course.entity.CourseVO;

public class CourseService implements CourseService_interface{
	private static final long PAGE_MAX_RESULT = 5;
	CourseDAO_interface dao;
	
	public CourseService() {
		dao = new CourseDAO();
	}

	@Override
	public int insert(CourseVO courseVO) {
		return dao.insert(courseVO);
	}

	@Override
	public int update(CourseVO courseVO) {
		return dao.update(courseVO);
	}

	@Override
	public int delete(Integer courseNo) {
		return dao.delete(courseNo);
	}

	@Override
	public CourseVO findByPK(Integer courseNo) {
		return dao.findByPK(courseNo);
	}

	@Override
	public List<CourseVO> findByName(String courseName) {
		return dao.findByName(courseName);
	}

	@Override
	public List<CourseVO> findByCoach(String coachNo) {
		return dao.findByCoach(coachNo);
	}

	@Override
	public List<CourseVO> getByCompositeQuery(Map<String, String[]> map) {
		Map<String, String> query = new HashMap<>();
		
		Set<Map.Entry<String, String[]>> entry = map.entrySet();
		
		for (Map.Entry<String, String[]> row : entry) {
			String key = row.getKey();
			// 因為請求參數裡包含了action，做個去除動作
			if ("action".equals(key)) {
				continue;
			}
			// 若是value為空即代表沒有查詢條件，做個去除動作
			String value = row.getValue()[0]; // getValue拿到一個String陣列, 接著[0]取得第一個元素檢查
			if (value == null || value.isEmpty()) {
				continue;
			}
			query.put(key, value);
		}
		
		System.out.println(query);
		
		return dao.getByCompositeQuery(query);
	}

	@Override
	public List<CourseVO> getAll() {
		return dao.getAll();
	}

	@Override
	public List<CourseVO> getAll(int currentPage) {
		return dao.getAll(currentPage);
	}

	@Override
	public int getTotalPage() {
		long total = dao.getTotal();
		int pageQty = (int)(total % PAGE_MAX_RESULT == 0 ? (total / PAGE_MAX_RESULT) : (total / PAGE_MAX_RESULT + 1));
		return pageQty;
	}
	
	
}
