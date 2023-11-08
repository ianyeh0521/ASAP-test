package com.asap.forum;

public class PostTypeVO {
	private Integer postTypeNo;
	private String postTypeName;
	public PostTypeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostTypeVO(Integer postTypeNo, String postTypeName) {
		super();
		this.postTypeNo = postTypeNo;
		this.postTypeName = postTypeName;
	}
	public Integer getPostTypeNo() {
		return postTypeNo;
	}
	public void setPostTypeNo(Integer postTypeNo) {
		this.postTypeNo = postTypeNo;
	}
	public String getPostTypeName() {
		return postTypeName;
	}
	public void setPostTypeName(String postTypeName) {
		this.postTypeName = postTypeName;
	}
	
}
