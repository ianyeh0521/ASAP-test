package com.asap.forum.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SavePost")
public class SavePostVO implements Serializable {
	
	@Override
	public String toString() {
		return "SavePostVO [sPNo=" + sPNo + ", postNo=" + postNo + ", mbrNo=" + mbrNo + "]";
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SPNo", updatable = false)
	private Integer sPNo;
	
	@Column(name="PostNo")
	private Integer postNo;
	
	@Column(name="MbrNo")
	private String mbrNo;
	
	public SavePostVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SavePostVO(Integer sPNo, Integer postNo, String mbrNo) {
		super();
		this.sPNo = sPNo;
		this.postNo = postNo;
		this.mbrNo = mbrNo;
	}
	public Integer getsPNo() {
		return sPNo;
	}
	public void setsPNo(Integer sPNo) {
		this.sPNo = sPNo;
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
	

	
	
}
