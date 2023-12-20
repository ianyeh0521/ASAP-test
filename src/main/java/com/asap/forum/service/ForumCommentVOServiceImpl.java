package com.asap.forum.service;

import java.util.List;

import com.asap.forum.dao.ForumCommentDAO;
import com.asap.forum.dao.ForumCommentDAO_interface;
import com.asap.forum.entity.ForumCommentVO;

public class ForumCommentVOServiceImpl implements ForumCommentVOService {

private  ForumCommentDAO_interface dao;
	
	public ForumCommentVOServiceImpl() {
		dao = new  ForumCommentDAO();
	}
	
	@Override
	public Integer addComment(ForumCommentVO forumComment) {
		return dao.add(forumComment);
	}

	@Override
	public List<ForumCommentVO> getComments(Integer postno) {
		return dao.getbyPostNo(postno);
	}

	@Override
	public Integer deleteComment(ForumCommentVO forumComment) {
		return dao.update(forumComment); 
		//change CmtStatus to 0
	}

	@Override
	public ForumCommentVO getOneComment(Integer cmtno) {
		return dao.findbyPK(cmtno);
	}

}
