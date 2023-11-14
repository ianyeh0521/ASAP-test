package com.asap.forum;

public class PostImgVO {
	private Integer postImgNo;
	private Integer postNo;
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
