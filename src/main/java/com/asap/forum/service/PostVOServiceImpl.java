package com.asap.forum.service;

import static com.asap.forum.util.Constants.PAGE_MAX_RESULT;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.regexp.recompile;

import com.asap.forum.dao.PostDAO;
import com.asap.forum.dao.PostDAO_interface;
import com.asap.forum.entity.PostVO;

public class PostVOServiceImpl implements PostVOService {

	private PostDAO_interface dao;
	
	public PostVOServiceImpl() {
		dao= new PostDAO();
	}
	
	@Override
	public Integer addPost(PostVO postVO) {
		return dao.addPost(postVO);
		
	}

	@Override
	public Integer updatePost(PostVO postVO) {
		return dao.update(postVO);
	}

	@Override
	public void deletePost(Integer postNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PostVO> getAllPosts() {
		// TODO Auto-generated method stub
		return dao.getAll();
	}

	
	@Override
	public List<PostVO> getbyPostCategory(Integer postType) {
		return dao.getbyCategory(postType);
	}
	
	
	@Override
	public List<PostVO> getbyPostTitle(String posttitle) {
		return dao.getbyPostTitle(posttitle);
	}

	@Override
	public List<PostVO> getAlltoShow() {
		return dao.getAlltoShow();
	}

	@Override
	public PostVO findbyPK(Integer postNo) {
		return dao.findbyPK(postNo);
	}

	@Override
	public List<PostVO> getAllbyDate() {
		return dao.getAllbyDate();
	}

	@Override
	public List<PostVO> getAllbyViews() {
		return dao.getAllbyViews();
	}

	@Override
	public List<PostVO> getMyPosts(String mbrNo) {
		return dao.getMyPosts(mbrNo);
	}

	@Override
	public PostVO backstageFindbyPK(Integer postNo) {
		return dao.backstageFindbyPK(postNo);
	}




//	public List<PostVO> getPostsByCompositeQuery(Map<String, String[]> map) {
//		// TODO Auto-generated method stub
//		Map<String, String> query = new HashMap<>();
//		// Map.Entry即代表一組key-value
//		Set<Map.Entry<String, String[]>> entry = map.entrySet();
//		
//		for (Map.Entry<String, String[]> row : entry) {
//			String key = row.getKey();
//			// 因為請求參數裡包含了action，做個去除動作
//			if ("action".equals(key)) {
//				continue;
//			}
//			// 若是value為空即代表沒有查詢條件，做個去除動作
//			String value = row.getValue()[0]; // getValue拿到一個String陣列, 接著[0]取得第一個元素檢查
//			if (value == null || value.isEmpty()) {
//				continue;
//			}
//			query.put(key, value);
//		}
//		System.out.println(query);
//		
//		return dao.getByCompositeQuery(query);
//	}



}
