package com.asap.forum;

import java.sql.Timestamp;

public class ForumCommentVO {
	private Integer cmtNo;
	private Integer postNo;
	private String  mbrNo;
	private String  cmtText;
	private Timestamp cmtCrtTime;
	private boolean cmtStatus;
	public ForumCommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ForumCommentVO(Integer cmtNo, Integer postNo, String mbrNo, String cmtText, Timestamp cmtCrtTime,
			boolean cmtStatus) {
		super();
		this.cmtNo = cmtNo;
		this.postNo = postNo;
		this.mbrNo = mbrNo;
		this.cmtText = cmtText;
		this.cmtCrtTime = cmtCrtTime;
		this.cmtStatus = cmtStatus;
	}
	public Integer getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(Integer cmtNo) {
		this.cmtNo = cmtNo;
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
	public String getCmtText() {
		return cmtText;
	}
	public void setCmtText(String cmtText) {
		this.cmtText = cmtText;
	}
	public Timestamp getCmtCrtTime() {
		return cmtCrtTime;
	}
	public void setCmtCrtTime(Timestamp cmtCrtTime) {
		this.cmtCrtTime = cmtCrtTime;
	}
	public boolean isCmtStatus() {
		return cmtStatus;
	}
	public void setCmtStatus(boolean cmtStatus) {
		this.cmtStatus = cmtStatus;
	}
	
}
