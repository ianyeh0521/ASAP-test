package com.asap.forum.service;

import java.util.List;

import com.asap.forum.dao.ForumReportDAO;
import com.asap.forum.dao.ForumReportDAO_interface;
import com.asap.forum.entity.ForumReportVO;

public class ForumReportVOServiceImpl implements ForumReportVOService {
	
	private  ForumReportDAO_interface dao;
	
	public ForumReportVOServiceImpl() {
		dao = new  ForumReportDAO();
	}
	
	public Integer add (ForumReportVO forumReport) {
		return dao.add(forumReport);
	}

	@Override
	public Integer update(ForumReportVO forumReport) {
		return dao.add(forumReport);
	}

	@Override
	public List<ForumReportVO> getAll() {
		return dao.getAll();
	}

	@Override
	public ForumReportVO findByPK(Integer fRptNo) {
		return dao.findByPK(fRptNo);
	}
}
