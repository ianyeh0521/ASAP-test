package com.asap.forum;

public class ForumReportTypeVO {
	private Integer fRptTypeNo;
	private String  fRptTypeName;
	public ForumReportTypeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ForumReportTypeVO(Integer fRptTypeNo, String fRptTypeName) {
		super();
		this.fRptTypeNo = fRptTypeNo;
		this.fRptTypeName = fRptTypeName;
	}
	public Integer getfRptTypeNo() {
		return fRptTypeNo;
	}
	public void setfRptTypeNo(Integer fRptTypeNo) {
		this.fRptTypeNo = fRptTypeNo;
	}
	public String getfRptTypeName() {
		return fRptTypeName;
	}
	public void setfRptTypeName(String fRptTypeName) {
		this.fRptTypeName = fRptTypeName;
	}
	
	
}
