package com.asap.forum.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="SavePost")
public class SavePostVO implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SPNo", updatable = false)
	private Integer sPNo;
	
	@ManyToOne
	@JoinColumn(name = "postNo", referencedColumnName = "postNo")
	private PostVO postVo;
	
	@Column(name="MbrNo")
	private String mbrNo;
	

	public Integer getsPNo() {
		return sPNo;
	}

	public SavePostVO(Integer sPNo, PostVO postVo, String mbrNo) {
		super();
		this.sPNo = sPNo;
		this.postVo = postVo;
		this.mbrNo = mbrNo;
	}

	public SavePostVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setsPNo(Integer sPNo) {
		this.sPNo = sPNo;
	}

	public PostVO getPostVo() {
		return postVo;
	}

	public void setPostVo(PostVO postVo) {
		this.postVo = postVo;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	@Override
	public String toString() {
		return "SavePostVO [sPNo=" + sPNo + ", postVo=" + postVo + ", mbrNo=" + mbrNo + "]";
	}

	
	
	

	
	
}
