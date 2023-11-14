package com.asap.forum;

import java.sql.Timestamp;

public class ForumLikeVO {
	private Integer likeNo;
	private String  mbrNo;
	private Integer postNo;
	private Integer cmtNo;
	private Timestamp likeTime;
	
	public ForumLikeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ForumLikeVO(Integer likeNo, String mbrNo, Integer postNo, Integer cmtNo, Timestamp likeTime) {
		super();
		this.likeNo = likeNo;
		this.mbrNo = mbrNo;
		this.postNo = postNo;
		this.cmtNo = cmtNo;
		this.likeTime = likeTime;
	}
	public Integer getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(Integer likeNo) {
		this.likeNo = likeNo;
	}
	public String getMbrNo() {
		return mbrNo;
	}
	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}
	public Integer getPostNo() {
		return postNo;
	}
	public void setPostNo(Integer postNo) {
		this.postNo = postNo;
	}
	public Integer getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(Integer cmtNo) {
		this.cmtNo = cmtNo;
	}
	public Timestamp getLikeTime() {
		return likeTime;
	}
	public void setLikeTime(Timestamp likeTime) {
		this.likeTime = likeTime;
	}
	
	
}
