package com.asap.forum.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="ForumComment")
public class ForumCommentVO {
	
	@Override
	public String toString() {
		return "ForumCommentVO [cmtNo=" + cmtNo + ", postNo=" + postNo + ", mbrNo=" + mbrNo + ", cmtText=" + cmtText
				+ ", cmtCrtTime=" + cmtCrtTime + ", cmtStatus=" + cmtStatus + "]";
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="CmtNo")
	private Integer cmtNo;
	
	@Column(name="PostNo")
	private Integer postNo;
	
	@Column(name="MbrNo")
	private String  mbrNo;
	
	@Column(name="CmtText")
	private String  cmtText;
	
	@CreationTimestamp
	@Column(name="CmtCrtTime")
	private Timestamp cmtCrtTime;
	
	@Column(name="CmtStatus")
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
