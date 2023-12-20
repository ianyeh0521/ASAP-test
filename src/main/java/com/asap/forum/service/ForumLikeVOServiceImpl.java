package com.asap.forum.service;

import com.asap.forum.dao.ForumLikeDAO;
import com.asap.forum.dao.ForumLikeDAO_interface;
import com.asap.forum.entity.ForumLikeVO;
import com.oracle.wls.shaded.org.apache.bcel.generic.RETURN;


public class ForumLikeVOServiceImpl implements ForumLikeVOService {

private  ForumLikeDAO_interface dao;
	
	public ForumLikeVOServiceImpl() {
		dao = new  ForumLikeDAO();
	}
	
	public Integer postLikecheck(String mbrNo, Integer postNo) {
		ForumLikeVO likeVO = dao.postisLiked(mbrNo, postNo);
		if (likeVO==null) {
			return 0;
		}else if (likeVO.isLikeStatus()) {
			return 1;
		}else {
			return 0;
		}
	
	}
	
	@Override
	public Integer postLike(String mbrNo, Integer postNo) {
		//查看是否有按讚
		ForumLikeVO likeVO = dao.postisLiked(mbrNo, postNo);
		if (likeVO==null) {
			ForumLikeVO likepost= new ForumLikeVO();
			likepost.setPostNo(postNo);
			likepost.setMbrNo(mbrNo);
			likepost.setLikeStatus(true);
			dao.add(likepost);
			return 1;
		}else if (likeVO.isLikeStatus()) {
			likeVO.setLikeStatus(false);
			dao.update(likeVO);
			return 0;
		}else {
			likeVO.setLikeStatus(true);
			dao.update(likeVO);
			return 1;
		}
	}


	@Override
	public Integer cmtLike(String mbrNo, Integer cmtNo) {
		ForumLikeVO likeVO = dao.cmtisLiked(mbrNo, cmtNo);
		if (likeVO==null) {
			ForumLikeVO likecmt= new ForumLikeVO();
			likecmt.setCmtNo(cmtNo);
			likecmt.setMbrNo(mbrNo);
			likecmt.setLikeStatus(true);
			dao.add(likecmt);
			return 1;
		}else if (likeVO.isLikeStatus()) {
			likeVO.setLikeStatus(false);
			dao.update(likeVO);
			return 0;
		}else {
			likeVO.setLikeStatus(true);
			dao.update(likeVO);
			return 1;
		}
	}

	@Override
	public String cmtLikecheck(String mbrNo, Integer cmtNo) {
		ForumLikeVO likeVO = dao.cmtisLiked(mbrNo, cmtNo);
		if (likeVO==null) {
			return "";
		}else if (likeVO.isLikeStatus()) {
			return "-up";
		}else {
			return "";
		}
	}
	
	public Long likeCounts(Integer postNo) {
		return dao.getLikes(postNo);
	}

}
