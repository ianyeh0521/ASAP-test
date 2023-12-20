package com.asap.forum.dao;

import java.util.List;

import com.asap.forum.entity.ForumReportVO;
import com.asap.forum.entity.PostVO;
import com.asap.forum.entity.SavePostVO;




public interface ForumReportDAO_interface {

	public Integer add (ForumReportVO forumReport);
	
	public Integer update(ForumReportVO forumReport);
	
	public List<ForumReportVO> getAll();
	
	public ForumReportVO findByPK(Integer fRptNo);
}
