package com.asap.forum;

import java.sql.Timestamp;

public class PostVO {
	 private Integer postNo;
	 private String  mbrNo;
	 private String postTitle;
	 private String postText;
	 private Timestamp postCrtTime;
	 private Integer postTypeNo;
	 private Integer postViews;
	 private boolean postStatus;
	
	 
	 public PostVO() {
		super();
		
	}


	public PostVO(Integer postNo, String mbrNo, String postTitle, String postText, Timestamp postCrtTime,
			Integer postTypeNo, Integer postViews, boolean postStatus) {
		super();
		this.postNo = postNo;
		this.mbrNo = mbrNo;
		this.postTitle = postTitle;
		this.postText = postText;
		this.postCrtTime = postCrtTime;
		this.postTypeNo = postTypeNo;
		this.postViews = postViews;
		this.postStatus = postStatus;
	}


	public Integer getPostNo() {
		return postNo;
	}


	public void setPostNo(Integer postNo) {
		this.postNo = postNo;
	}


	public String getMbrNo() {
		return mbrNo;
	}


	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}


	public String getPostTitle() {
		return postTitle;
	}


	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}


	public String getPostText() {
		return postText;
	}


	public void setPostText(String postText) {
		this.postText = postText;
	}


	public Timestamp getPostCrtTime() {
		return postCrtTime;
	}


	public void setPostCrtTime(Timestamp postCrtTime) {
		this.postCrtTime = postCrtTime;
	}


	public Integer getPostTypeNo() {
		return postTypeNo;
	}


	public void setPostTypeNo(Integer postTypeNo) {
		this.postTypeNo = postTypeNo;
	}


	public Integer getPostViews() {
		return postViews;
	}


	public void setPostViews(Integer postViews) {
		this.postViews = postViews;
	}


	public boolean isPostStatus() {
		return postStatus;
	}


	public void setPostStatus(boolean postStatus) {
		this.postStatus = postStatus;
	}
	 
	
}
