package com.asap.forum.dao;

import java.util.List;

import com.asap.forum.entity.ForumLikeVO;


public interface ForumLikeDAO_interface {
	
	public Integer add (ForumLikeVO forumlike);
	
	public Integer update (ForumLikeVO forumlike);
	
	public List<ForumLikeVO> findMyLike (String mbrNo);
	
	public Long getLikes(Integer postNo);
}
