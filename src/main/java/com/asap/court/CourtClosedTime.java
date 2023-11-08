package com.asap.court;

import java.io.Serializable;
import java.sql.Date;

public class CourtClosedTime implements Serializable {

	private Integer courtClosedTimeNo;
	private Integer courtNo;
	private Date courtClosedDate;
	private Integer courtClosedTime;
	
	public CourtClosedTime() {
	}

	public CourtClosedTime(Integer courtClosedTimeNo, Integer courtNo, Date courtClosedDate,
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
	
	
	
	
}
