package com.asap.coach.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sportcert")
public class SportCertVO implements Serializable{

	@Id
	@Column(name = "SportCertNo", updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer sportCertNo;
	@Column(name = "SportType")
	private Integer sportType;
	@Column(name = "CoachNo", updatable = false)
	private String coachNo;
	@Column(name = "SportCertImg", columnDefinition = "longblob")
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
