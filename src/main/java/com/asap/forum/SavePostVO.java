package com.asap.forum;

public class SavePostVO {
	private Integer sPNo;
	private Integer postNo;
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
