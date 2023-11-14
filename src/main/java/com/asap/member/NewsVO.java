package com.asap.member;

import java.io.Serializable;
import java.sql.Timestamp;

public class NewsVO implements Serializable {
	private Integer newsNo;
	private String newsSubj, newsText;
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

}
