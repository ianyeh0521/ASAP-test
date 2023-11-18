package com.asap.court.entity;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CourtClosedTime")
public class CourtClosedTimeVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourtClosedTimeNo", updatable = false)
	private Integer courtClosedTimeNo;
	
	@Column(name = "CourtNo")
	private Integer courtNo;
	
	@Column(name = "CourtClosedDate")
	private Date courtClosedDate;
	
	@Column(name = "CourtClosedTime")
	private Integer courtClosedTime;
	
	public CourtClosedTimeVO() {
	}

	public CourtClosedTimeVO(Integer courtClosedTimeNo, Integer courtNo, Date courtClosedDate,
			Integer courtClosedTime) {
		super();
		this.courtClosedTimeNo = courtClosedTimeNo;
		this.courtNo = courtNo;
		this.courtClosedDate = courtClosedDate;
		this.courtClosedTime = courtClosedTime;
	}

	public Integer getCourtClosedTimeNo() {
		return courtClosedTimeNo;
	}

	public void setCourtClosedTimeNo(Integer courtClosedTimeNo) {
		this.courtClosedTimeNo = courtClosedTimeNo;
	}

	public Integer getCourtNo() {
		return courtNo;
	}

	public void setCourtNo(Integer courtNo) {
		this.courtNo = courtNo;
	}

	public Date getCourtClosedDate() {
		return courtClosedDate;
	}

	public void setCourtClosedDate(Date courtClosedDate) {
		this.courtClosedDate = courtClosedDate;
	}

	public Integer getCourtClosedTime() {
		return courtClosedTime;
	}

	public void setCourtClosedTime(Integer courtClosedTime) {
		this.courtClosedTime = courtClosedTime;
	}

	@Override
	public String toString() {
		return "CourtClosedTimeVO [courtClosedTimeNo=" + courtClosedTimeNo + ", courtNo=" + courtNo
				+ ", courtClosedDate=" + courtClosedDate + ", courtClosedTime=" + courtClosedTime + "]";
	}
	
	
	
	
}
