package com.asap.forum.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.CreationTimestamp;


@Entity
@Table(name="Post")
public class PostVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PostNo", updatable = false)
	private Integer postNo;
	
	@Column(name="MbrNo")
	private String  mbrNo;
	
	@Column(name="PostTitle")
	private String postTitle;
	
	@Column(name="PostText", columnDefinition = "longtext" )
	private String postText;
	
	@CreationTimestamp
	@Column(name="PostCrtTime")
	private Timestamp postCrtTime;
	
	
//	@Column(name="PostTypeNo")
//	private Integer postTypeNo;
//	
	@ManyToOne
	@JoinColumn(name = "postTypeNo", referencedColumnName = "postTypeNo")
	private PostTypeVO postTypeVO;
	
	@Column(name="PostViews")
	private Integer postViews;
	
	@Column(name="PostStatus")
	private Integer postStatus;
	
	 
//	 @Override
//	public String toString() {
//		return "PostVO [postNo=" + postNo + ", mbrNo=" + mbrNo + ", postTitle=" + postTitle + ", postText=" + postText
//				+ ", postCrtTime=" + postCrtTime + ", postTypeNo=" + postTypeNo + ", postViews=" + postViews
//				+ ", postStatus=" + postStatus + "]";
//	}

	

	public PostVO() {
		super();
		
	}


//	public PostVO(Integer postNo, String mbrNo, String postTitle, String postText, Timestamp postCrtTime,
//			Integer postTypeNo, Integer postViews, Integer postStatus) {
//		super();
//		this.postNo = postNo;
//		this.mbrNo = mbrNo;
//		this.postTitle = postTitle;
//		this.postText = postText;
//		this.postCrtTime = postCrtTime;
//		this.postTypeNo = postTypeNo;
//		this.postViews = postViews;
//		this.postStatus = postStatus;
//	}


	public Integer getPostNo() {
		return postNo;
	}


	@Override
	public String toString() {
		return "PostVO [postNo=" + postNo + ", mbrNo=" + mbrNo + ", postTitle=" + postTitle + ", postText=" + postText
				+ ", postCrtTime=" + postCrtTime + ", postTypeVO=" + postTypeVO + ", postViews=" + postViews
				+ ", postStatus=" + postStatus + "]";
	}


	public PostVO(Integer postNo, String mbrNo, String postTitle, String postText, Timestamp postCrtTime,
		PostTypeVO postTypeVO, Integer postViews, Integer postStatus) {
	super();
	this.postNo = postNo;
	this.mbrNo = mbrNo;
	this.postTitle = postTitle;
	this.postText = postText;
	this.postCrtTime = postCrtTime;
	this.postTypeVO = postTypeVO;
	this.postViews = postViews;
	this.postStatus = postStatus;
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


//	public Integer getPostTypeNo() {
//		return postTypeNo;
//	}
//
//
//	public void setPostTypeNo(Integer postTypeNo) {
//		this.postTypeNo = postTypeNo;
//	}


	public Integer getPostViews() {
		return postViews;
	}


	public PostTypeVO getPostTypeVO() {
		return postTypeVO;
	}


	public void setPostTypeVO(PostTypeVO postTypeVO) {
		this.postTypeVO = postTypeVO;
	}


	public void setPostViews(Integer postViews) {
		this.postViews = postViews;
	}


	public Integer getPostStatus() {
		return postStatus;
	}


	public void setPostStatus(Integer postStatus) {
		this.postStatus = postStatus;
	}






	 
	
}
