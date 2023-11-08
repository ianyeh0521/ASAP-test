package com.asap.court;

import java.io.Serializable;

public class CourtSaveListVO implements Serializable{

	private Integer courtSaveNo;
	private String mbrNo;
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
	
	
}
