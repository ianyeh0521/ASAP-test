package com.asap.member;

import java.io.Serializable;

public class MbrNewsVO implements Serializable {
	private Integer mbrNewsNo, newsNo;
	private String mbrNo, coachNo;

	public MbrNewsVO() {
	}

	public MbrNewsVO(Integer mbrNewsNo, Integer newsNo, String mbrNo, String coachNo) {
		this.mbrNewsNo = mbrNewsNo;
		this.newsNo = newsNo;
		this.mbrNo = mbrNo;
		this.coachNo = coachNo;
	}

	public Integer getMbrNewsNo() {
		return mbrNewsNo;
	}

	public void setMbrNewsNo(Integer mbrNewsNo) {
		this.mbrNewsNo = mbrNewsNo;
	}

	public Integer getNewsNo() {
		return newsNo;
	}

	public void setNewsNo(Integer newsNo) {
		this.newsNo = newsNo;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public String getCoachNo() {
		return coachNo;
	}

	public void setCoachNo(String coachNo) {
		this.coachNo = coachNo;
	}

}
