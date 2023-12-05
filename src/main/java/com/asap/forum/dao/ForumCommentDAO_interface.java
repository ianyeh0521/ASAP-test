package com.asap.forum.dao;

import java.util.List;

import com.asap.forum.entity.ForumCommentVO;
import com.asap.forum.entity.SavePostVO;

public interface ForumCommentDAO_interface {
	public Integer add (ForumCommentVO forumComment);
	public Integer update (ForumCommentVO forumComment);
	public ForumCommentVO findbyPK (Integer cmtNo);
	public List<ForumCommentVO> getbyPostNo(Integer postno);
}
