package com.asap.forum.service;

import java.util.List;
import java.util.Map;

import com.asap.forum.entity.PostVO;



public interface PostVOService {

	public Integer addPost(PostVO postVO);
	
	public PostVO updatePost(PostVO postVO);
	
	public void deletePost(Integer postNo);
	
	public List<PostVO> getAllPosts();
	
}
