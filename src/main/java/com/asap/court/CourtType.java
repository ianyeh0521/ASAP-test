package com.asap.court;

import java.io.Serializable;

public class CourtType implements Serializable {

	private Integer courtTypeNo;
	private String courtType;
	
	public CourtType() {
	}

	public CourtType(Integer courtTypeNo, String courtType) {
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
	
	
}
