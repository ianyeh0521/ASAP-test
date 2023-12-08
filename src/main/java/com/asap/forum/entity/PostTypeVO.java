package com.asap.forum.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PostType")
public class PostTypeVO {
	
	@Id
	@Column(name="PostTypeNo")
	private Integer postTypeNo;
	
	@Column(name="PostTypeName")
	private String postTypeName;
	
	@Override
	public String toString() {
		return "PostTypeVO [postTypeNo=" + postTypeNo + ", postTypeName=" + postTypeName + "]";
	}
	
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
