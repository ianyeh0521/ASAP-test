package com.asap.court.entity;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="CourtClosedTime")
public class CourtClosedTimeVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourtClosedTimeNo", updatable = false)
	private Integer courtClosedTimeNo;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="CourtNo", referencedColumnName = "CourtNo")
	private CourtVO courtVO;
	
	@Column(name = "CourtClosedDate")
	private Date courtClosedDate;
	
	@Column(name = "CourtClosedTime")
	private Integer courtClosedTime;
	
	public CourtClosedTimeVO() {
	}


	public CourtClosedTimeVO(Integer courtClosedTimeNo, CourtVO courtVO, Date courtClosedDate,
			Integer courtClosedTime) {
		super();
		this.courtClosedTimeNo = courtClosedTimeNo;
		this.courtVO = courtVO;
		this.courtClosedDate = courtClosedDate;
		this.courtClosedTime = courtClosedTime;
	}


	public CourtClosedTimeVO(CourtVO courtVO, Date courtClosedDate, Integer courtClosedTime) {
		super();
		this.courtVO = courtVO;
		this.courtClosedDate = courtClosedDate;
		this.courtClosedTime = courtClosedTime;
	}


	public Integer getCourtClosedTimeNo() {
		return courtClosedTimeNo;
	}

	public void setCourtClosedTimeNo(Integer courtClosedTimeNo) {
		this.courtClosedTimeNo = courtClosedTimeNo;
	}


	public CourtVO getCourtVO() {
		return courtVO;
	}


	public void setCourtVO(CourtVO courtVO) {
		this.courtVO = courtVO;
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
		return "CourtClosedTimeVO [courtClosedTimeNo=" + courtClosedTimeNo + ", courtVO=" + courtVO
				+ ", courtClosedDate=" + courtClosedDate + ", courtClosedTime=" + courtClosedTime + "]";
	}


	
}
