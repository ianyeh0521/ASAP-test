package com.asap.forum.service;

public interface ForumLikeVOService {

	public Integer postLike(String mbrNo, Integer postNo);
	
	public Integer cmtLike(String mbrNo, Integer cmtNo);
	
	public Integer postLikecheck(String mbrNo, Integer postNo);
	
	public String cmtLikecheck(String mbrNo, Integer cmtNo);
}
