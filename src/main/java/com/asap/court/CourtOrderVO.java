package com.asap.court;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class CourtOrderVO implements Serializable{

	private Integer courtOrdNo;
	private String mbrNo;
	private Integer courtNo;
	private Boolean courtOrdStat;
	private Timestamp courtOrdCrtTime;
	private Date courtOrdDate;
	private Integer courtOrdTime;
	private Integer totalPrice;
	
	public CourtOrderVO() {
	}

	public CourtOrderVO(Integer courtOrdNo, String mbrNo, Integer courtNo, Boolean courtOrdStat,
			Timestamp courtOrdCrtTime, Date courtOrdDate, Integer courtOrdTime, Integer totalPrice) {
		super();
		this.courtOrdNo = courtOrdNo;
		this.mbrNo = mbrNo;
		this.courtNo = courtNo;
		this.courtOrdStat = courtOrdStat;
		this.courtOrdCrtTime = courtOrdCrtTime;
		this.courtOrdDate = courtOrdDate;
		this.courtOrdTime = courtOrdTime;
		this.totalPrice = totalPrice;
	}

	public Integer getCourtOrdNo() {
		return courtOrdNo;
	}

	public void setCourtOrdNo(Integer courtOrdNo) {
		this.courtOrdNo = courtOrdNo;
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

	public Boolean getCourtOrdStat() {
		return courtOrdStat;
	}

	public void setCourtOrdStat(Boolean courtOrdStat) {
		this.courtOrdStat = courtOrdStat;
	}

	public Timestamp getCourtOrdCrtTime() {
		return courtOrdCrtTime;
	}

	public void setCourtOrdCrtTime(Timestamp courtOrdCrtTime) {
		this.courtOrdCrtTime = courtOrdCrtTime;
	}

	public Date getCourtOrdDate() {
		return courtOrdDate;
	}

	public void setCourtOrdDate(Date courtOrdDate) {
		this.courtOrdDate = courtOrdDate;
	}

	public Integer getCourtOrdTime() {
		return courtOrdTime;
	}

	public void setCourtOrdTime(Integer courtOrdTime) {
		this.courtOrdTime = courtOrdTime;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
