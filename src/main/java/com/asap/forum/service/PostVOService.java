package com.asap.forum.service;

import java.util.List;
import java.util.Map;

import com.asap.forum.entity.PostVO;



public interface PostVOService {

	public Integer addPost(PostVO postVO);
	
	public Integer updatePost(PostVO postVO);
	
	public PostVO findbyPK(Integer postNo);
	
	public List<PostVO> getbyPostTitle(String posttitle);
	
	public void deletePost(Integer postNo);
	
	public List<PostVO> getAllPosts();
	
	public List<PostVO> getAlltoShow();

	public List<PostVO> getbyPostCategory(Integer postType); 
	
	public List<PostVO> getAllbyDate();
	
	public List<PostVO> getAllbyViews();
}
