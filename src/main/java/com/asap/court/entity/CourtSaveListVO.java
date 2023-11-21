package com.asap.court.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CourtSaveList")
public class CourtSaveListVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourtSaveNo", updatable = false)
	private Integer courtSaveNo;
	
	@Column(name = "MbrNo")
	private String mbrNo;
	
	@Column(name = "CourtNo")
	private Integer courtNo;
	
	public CourtSaveListVO() {
	}

	public CourtSaveListVO(Integer courtSaveNo, String mbrNo, Integer courtNo) {
		super();
		this.courtSaveNo = courtSaveNo;
		this.mbrNo = mbrNo;
		this.courtNo = courtNo;
	}

	public Integer getCourtSaveNo() {
		return courtSaveNo;
	}

	public void setCourtSaveNo(Integer courtSaveNo) {
		this.courtSaveNo = courtSaveNo;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public Integer getCourtNo() {
		return courtNo;
	}

	public void setCourtNo(Integer courtNo) {
		this.courtNo = courtNo;
	}

	@Override
	public String toString() {
		return "CourtSaveListVO [courtSaveNo=" + courtSaveNo + ", mbrNo=" + mbrNo + ", courtNo=" + courtNo + "]";
	}
	
	
}
