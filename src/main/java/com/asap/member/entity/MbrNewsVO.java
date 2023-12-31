package com.asap.member.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "mbrnews")
public class MbrNewsVO implements Serializable {
	
	@Id
	@Column(name = "MbrNewsNo", updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mbrNewsNo;
	@Column(name = "MbrNo", updatable = false)
	private String mbrNo;
	@Column(name = "NewsSubj")
	private String newsSubj;
	@Column(name = "NewsText")
	private String newsText;
	@CreationTimestamp
	@Column(name = "NewsTime")
	private Timestamp newsTime;

	public MbrNewsVO() {
	}

	public MbrNewsVO(Integer mbrNewsNo, String mbrNo, String newsSubj, String newsText, Timestamp newsTime) {
		this.mbrNewsNo = mbrNewsNo;
		this.mbrNo = mbrNo;
		this.newsSubj = newsSubj;
		this.newsText = newsText;
		this.newsTime = newsTime;
	}

	public Integer getMbrNewsNo() {
		return mbrNewsNo;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public String getNewsSubj() {
		return newsSubj;
	}

	public String getNewsText() {
		return newsText;
	}

	public Timestamp getNewsTime() {
		return newsTime;
	}

	public void setMbrNewsNo(Integer mbrNewsNo) {
		this.mbrNewsNo = mbrNewsNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public void setNewsSubj(String newsSubj) {
		this.newsSubj = newsSubj;
	}

	public void setNewsText(String newsText) {
		this.newsText = newsText;
	}

	public void setNewsTime(Timestamp newsTime) {
		this.newsTime = newsTime;
	}

	@Override
	public String toString() {
		return "MbrNewsVO [mbrNewsNo=" + mbrNewsNo + ", mbrNo=" + mbrNo + ", newsSubj=" + newsSubj + ", newsText="
				+ newsText + ", newsTime=" + newsTime + "]";
	}

	

}
