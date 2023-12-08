package com.asap.forum.service;

import java.util.List;

import com.asap.forum.entity.ForumReportVO;

public interface ForumReportVOService {
	public Integer add (ForumReportVO forumReport);
	
	public Integer update (ForumReportVO forumReport);
	
	public List<ForumReportVO> getAll();
}
