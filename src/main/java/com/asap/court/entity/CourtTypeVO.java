package com.asap.court.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CourtType")
public class CourtTypeVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourtTypeNo", updatable = false)
	private Integer courtTypeNo;
	
	@Column(name = "CourtType")
	private String courtType;
	
	public CourtTypeVO() {
	}

	public CourtTypeVO(Integer courtTypeNo, String courtType) {
		super();
		this.courtTypeNo = courtTypeNo;
		this.courtType = courtType;
	}

	public Integer getCourtTypeNo() {
		return courtTypeNo;
	}

	public void setCourtTypeNo(Integer courtTypeNo) {
		this.courtTypeNo = courtTypeNo;
	}

	public String getCourtType() {
		return courtType;
	}

	public void setCourtType(String courtType) {
		this.courtType = courtType;
	}

	@Override
	public String toString() {
		return "CourtTypeVO [courtTypeNo=" + courtTypeNo + ", courtType=" + courtType + "]";
	}
	
	
	
}
