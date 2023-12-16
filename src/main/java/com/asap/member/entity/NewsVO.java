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
@Table(name = "news")
public class NewsVO implements Serializable {
	
	@Id
	@Column(name = "NewsNo")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer newsNo;
	@Column(name = "NewsSubj")
	private String newsSubj;
	@Column(name = "NewsText")
	private String newsText;
	@CreationTimestamp
	@Column(name = "NewsTime")
	private Timestamp newsTime;

	public NewsVO() {
	}

	public NewsVO(Integer newsNo, String newsSubj, String newsText, Timestamp newsTime) {
		this.newsNo = newsNo;
		this.newsSubj = newsSubj;
		this.newsText = newsText;
		this.newsTime = newsTime;
	}

	public Integer getNewsNo() {
		return newsNo;
	}

	public void setNewsNo(Integer newsNo) {
		this.newsNo = newsNo;
	}

	public String getNewsSubj() {
		return newsSubj;
	}

	public void setNewsSubj(String newsSubj) {
		this.newsSubj = newsSubj;
	}

	public String getNewsText() {
		return newsText;
	}

	public void setNewsText(String newsText) {
		this.newsText = newsText;
	}

	public Timestamp getNewsTime() {
		return newsTime;
	}

	public void setNewsTime(Timestamp newsTime) {
		this.newsTime = newsTime;
	}

	@Override
	public String toString() {
		return "NewsVO [newsNo=" + newsNo + ", newsSubj=" + newsSubj + ", newsText=" + newsText + ", newsTime="
				+ newsTime + "]";
	}

}
