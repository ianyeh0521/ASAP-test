package com.asap.coach.entity;

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
@Table(name = "couchnews")
public class CoachNewsVO implements Serializable {
	
	@Id
	@Column(name = "CoachNewsNo", updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer coachNewsNo;
	@Column(name = "CoachNo", updatable = false)
	private String coachNo;
	@Column(name = "NewsSubj")
	private String newsSubj;
	@Column(name = "NewsText")
	private String newsText;
	@CreationTimestamp
	@Column(name = "NewsTime")
	private Timestamp newsTime;

	public CoachNewsVO() {
	}

	public CoachNewsVO(Integer coachNewsNo, String coachNo, String newsSubj, String newsText, Timestamp newsTime) {
		this.coachNewsNo = coachNewsNo;
		this.coachNo = coachNo;
		this.newsSubj = newsSubj;
		this.newsText = newsText;
		this.newsTime = newsTime;
	}

	public Integer getCoachNewsNo() {
		return coachNewsNo;
	}

	public String getCoachNo() {
		return coachNo;
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

	public void setCoachNewsNo(Integer coachNewsNo) {
		this.coachNewsNo = coachNewsNo;
	}

	public void setCoachNo(String coachNo) {
		this.coachNo = coachNo;
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
		return "CoachNewsVO [coachNewsNo=" + coachNewsNo + ", coachNo=" + coachNo + ", newsSubj=" + newsSubj
				+ ", newsText=" + newsText + ", newsTime=" + newsTime + "]";
	}

	
}
