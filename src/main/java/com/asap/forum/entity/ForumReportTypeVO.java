package com.asap.forum.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ForumReportType")
public class ForumReportTypeVO {
	
	@Id
	@Column(name="FRptTypeNo")
	private Integer fRptTypeNo;
	
	@Column(name="FRptTypeName")
	private String  fRptTypeName;
	public ForumReportTypeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Integer getfRptTypeNo() {
		return fRptTypeNo;
	}
	public ForumReportTypeVO(Integer fRptTypeNo) {
		super();
		this.fRptTypeNo = fRptTypeNo;
	}
	public ForumReportTypeVO(Integer fRptTypeNo, String fRptTypeName) {
		super();
		this.fRptTypeNo = fRptTypeNo;
		this.fRptTypeName = fRptTypeName;
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
