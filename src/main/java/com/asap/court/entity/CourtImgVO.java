package com.asap.court.entity;

import java.util.Arrays;

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
@Table(name="CourtImg")
public class CourtImgVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourtImgNo", updatable = false)
	private Integer courtImgNo;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="CourtNo", referencedColumnName = "CourtNo")
	private CourtVO courtVO;
	
	@Column(name = "CourtImg", columnDefinition = "longblob")
	private byte[] courtImg;
	
	public CourtImgVO() {
	}
	

	public CourtImgVO(Integer courtImgNo, CourtVO courtVO, byte[] courtImg) {
		super();
		this.courtImgNo = courtImgNo;
		this.courtVO = courtVO;
		this.courtImg = courtImg;
	}
	
	public CourtImgVO(CourtVO courtVO, byte[] courtImg) {
		super();
		this.courtVO = courtVO;
		this.courtImg = courtImg;
	}


	public Integer getCourtImgNo() {
		return courtImgNo;
	}

	public void setCourtImgNo(Integer courtImgNo) {
		this.courtImgNo = courtImgNo;
	}



	public CourtVO getCourtVO() {
		return courtVO;
	}



	public void setCourtVO(CourtVO courtVO) {
		this.courtVO = courtVO;
	}



	public byte[] getCourtImg() {
		return courtImg;
	}

	public void setCourtImg(byte[] courtImg) {
		this.courtImg = courtImg;
	}



	@Override
	public String toString() {
		return "CourtImgVO [courtImgNo=" + courtImgNo + ", courtVO=" + courtVO + ", courtImg="
				+ Arrays.toString(courtImg) + "]";
	}

	
	
	
}
