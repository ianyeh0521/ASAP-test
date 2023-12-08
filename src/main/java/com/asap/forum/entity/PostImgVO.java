package com.asap.forum.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PostImg")
public class PostImgVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PostImgNo", updatable = false)
	private Integer postImgNo;
	
	@Column(name ="PostNo")
	private Integer postNo;
	
	@Column(name = "PostImg", columnDefinition = "longblob")
	private byte[] postImg;
	
	public PostImgVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PostImgVO(Integer postImgNo, Integer postNo, byte[] postImg) {
		super();
		this.postImgNo = postImgNo;
		this.postNo = postNo;
		this.postImg = postImg;
	}

	public Integer getPostImgNo() {
		return postImgNo;
	}

	public void setPostImgNo(Integer postImgNo) {
		this.postImgNo = postImgNo;
	}

	public Integer getPostNo() {
		return postNo;
	}

	public void setPostNo(Integer postNo) {
		this.postNo = postNo;
	}

	public byte[] getPostImg() {
		return postImg;
	}

	public void setPostImg(byte[] postImg) {
		this.postImg = postImg;
	}
	
	
}
