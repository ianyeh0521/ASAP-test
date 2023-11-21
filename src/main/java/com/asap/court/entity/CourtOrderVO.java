package com.asap.court.entity;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CourtOrder")
public class CourtOrderVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourtOrdNo", updatable = false)
	private Integer courtOrdNo;
	
	@Column(name = "MbrNo")
	private String mbrNo;
	
	@Column(name = "CourtNo")
	private Integer courtNo;
	
	@Column(name = "CourtOrdStat")
	private Boolean courtOrdStat;
	
	@Column(name = "CourtOrdCrtTime")
	private Timestamp courtOrdCrtTime;
	
	@Column(name = "CourtOrdDate")
	private Date courtOrdDate;
	
	@Column(name = "CourtOrdTime")
	private Integer courtOrdTime;
	
	@Column(name = "TotalPrice")
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

	@Override
	public String toString() {
		return "CourtOrderVO [courtOrdNo=" + courtOrdNo + ", mbrNo=" + mbrNo + ", courtNo=" + courtNo
				+ ", courtOrdStat=" + courtOrdStat + ", courtOrdCrtTime=" + courtOrdCrtTime + ", courtOrdDate="
				+ courtOrdDate + ", courtOrdTime=" + courtOrdTime + ", totalPrice=" + totalPrice + "]";
	}
	
	
}
