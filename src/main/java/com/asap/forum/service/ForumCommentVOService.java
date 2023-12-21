package com.asap.forum.service;

import java.util.List;

import com.asap.forum.entity.ForumCommentVO;

public interface ForumCommentVOService {
	
	public Integer addComment(ForumCommentVO forumComment);
	
	public List<ForumCommentVO> getComments(Integer postno);
	
	//修改CmtStatus
	public Integer deleteComment(ForumCommentVO forumComment);
	
	public ForumCommentVO getOneComment(Integer cmtno);
	
	public Integer uodateComment(ForumCommentVO forumComment);
}
