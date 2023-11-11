package com.asap.coach;

import java.io.Serializable;

public class SportCertVO implements Serializable{

	private Integer sportCertNo, sportType;
	private String coachNo;
	private byte[] sportCertImg;

	public SportCertVO() {
	}

	public SportCertVO(Integer sportCertNo, Integer sportType, String coachNo, byte[] sportCertImg) {
		this.sportCertNo = sportCertNo;
		this.sportType = sportType;
		this.coachNo = coachNo;
		this.sportCertImg = sportCertImg;
	}

	public Integer getSportCertNo() {
		return sportCertNo;
	}

	public void setSportCertNo(Integer sportCertNo) {
		this.sportCertNo = sportCertNo;
	}

	public Integer getSportType() {
		return sportType;
	}

	public void setSportType(Integer sportType) {
		this.sportType = sportType;
	}

	public String getCoachNo() {
		return coachNo;
	}

	public void setCoachNo(String coachNo) {
		this.coachNo = coachNo;
	}

	public byte[] getSportCertImg() {
		return sportCertImg;
	}

	public void setSportCertImg(byte[] sportCertImg) {
		this.sportCertImg = sportCertImg;
	}

}
