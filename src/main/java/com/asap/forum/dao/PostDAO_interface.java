package com.asap.forum.dao;

import java.util.List;
import java.util.Map;

import com.asap.forum.entity.PostVO;


public interface PostDAO_interface {
	
	//新增貼文
	public Integer addPost (PostVO post);
	
	public PostVO findbyPK(Integer postNo);
	
	//刪除貼文(更改poststatus)
	public Integer delete (Integer postNo);
	
	public Integer update (PostVO post);

	public List<PostVO> getAllbyDate();
	
	public List<PostVO> getbyCategory(Integer posttypeno);
	
	public List<PostVO> getAllbyViews();

	public List<PostVO> getAll();
	
	public List<PostVO> getMyPosts(String mbrNo);
	
	public List<PostVO> getbyPostTitle(String posttitle);
	
//	public List<PostVO> getByCompositeQuery(Map<String, String> map);
	


	
}
