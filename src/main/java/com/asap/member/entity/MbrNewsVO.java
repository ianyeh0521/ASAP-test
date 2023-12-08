package com.asap.member.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "mbrnews")
public class MbrNewsVO implements Serializable {
	
	@Id
	@Column(name = "MbrNewsNo", updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mbrNewsNo;
	@Column(name = "NewsNo", updatable = false)
	private Integer newsNo;
	@Column(name = "MbrNo", updatable = false)
	private String mbrNo;
	@Column(name = "CoachNo", updatable = false)
	private String coachNo;

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

	@Override
	public String toString() {
		return "MbrNewsVO [mbrNewsNo=" + mbrNewsNo + ", newsNo=" + newsNo + ", mbrNo=" + mbrNo + ", coachNo=" + coachNo
				+ "]";
	}

}
