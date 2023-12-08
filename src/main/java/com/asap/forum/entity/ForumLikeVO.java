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
@Table(name="ForumLike")
public class ForumLikeVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "LikeNo")
	private Integer likeNo;
	
	@Column(name = "MbrNo")
	private String  mbrNo;
	
	@Column(name = "PostNo")
	private Integer postNo;
	
	@Column(name = "CmtNo")
	private Integer cmtNo;
	
	@CreationTimestamp
	@Column(name = "LikeTime")
	private Timestamp likeTime;
	
	@Column(name = "LikeStat")
	private boolean likeStat;
	
	public ForumLikeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ForumLikeVO(Integer likeNo, String mbrNo, Integer postNo, Integer cmtNo, Timestamp likeTime, boolean likeStat) {
		super();
		this.likeNo = likeNo;
		this.mbrNo = mbrNo;
		this.postNo = postNo;
		this.cmtNo = cmtNo;
		this.likeTime = likeTime;
		this.likeStat=likeStat;
	}
	public boolean isLikeStatus() {
		return likeStat;
	}
	public void setLikeStatus(boolean likeStat) {
		this.likeStat = likeStat;
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
