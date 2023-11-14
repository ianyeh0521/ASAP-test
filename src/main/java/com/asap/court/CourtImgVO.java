package com.asap.court;

import java.io.Serializable;

public class CourtImgVO implements Serializable{

	private Integer courtImgNo;
	private Integer courtNo;
	private Byte[] courtImg;
	
	public CourtImgVO() {
	}

	public CourtImgVO(Integer courtImgNo, Integer courtNo, Byte[] courtImg) {
		super();
		this.courtImgNo = courtImgNo;
		this.courtNo = courtNo;
		this.courtImg = courtImg;
	}

	public Integer getCourtImgNo() {
		return courtImgNo;
	}

	public void setCourtImgNo(Integer courtImgNo) {
		this.courtImgNo = courtImgNo;
	}

	public Integer getCourtNo() {
		return courtNo;
	}

	public void setCourtNo(Integer courtNo) {
		this.courtNo = courtNo;
	}

	public Byte[] getCourtImg() {
		return courtImg;
	}

	public void setCourtImg(Byte[] courtImg) {
		this.courtImg = courtImg;
	}
	
	
}
