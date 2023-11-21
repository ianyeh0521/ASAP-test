package com.asap.court.entity;


import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Court")
public class CourtVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourtNo", updatable = false)
	private Integer courtNo;
	
	@Column(name = "CourtName")
	private String courtName;
	
	@Column(name = "CourtTypeNo")
	private Integer courtTypeNo;
	
	@Column(name = "Indoor")
	private Boolean indoor;
	
	@Column(name = "CourtAddress")
	private String courtAddress;
	
	@Column(name = "SiteNo")
	private Integer siteNo;
	
	@Column(name = "CourtLong")
	private BigDecimal courtLong;
	
	@Column(name = "CourtLat")
	private BigDecimal courtLat;
	
	@Column(name = "CourtText")
	private String courtText;
	
	@Column(name = "CourtPplLimit")
	private Integer courtPplLimit;
	
	@Column(name = "CourtPrice")
	private Integer courtPrice;
	
	@Column(name = "CourtCrtTime")
	private Timestamp courtCrtTime;
	
	@Column(name = "CourtStat")
	private Boolean courtStat;

	public CourtVO() {
	}

	public CourtVO(Integer courtNo, String courtName, Integer courtTypeNo, Boolean indoor, String courtAddress,
			Integer siteNo, BigDecimal courtLong, BigDecimal courtLat, String courtText, Integer courtPplLimit,
			Integer courtPrice, Timestamp courtCrtTime, Boolean courtStat) {
		super();
		this.courtNo = courtNo;
		this.courtName = courtName;
		this.courtTypeNo = courtTypeNo;
		this.indoor = indoor;
		this.courtAddress = courtAddress;
		this.siteNo = siteNo;
		this.courtLong = courtLong;
		this.courtLat = courtLat;
		this.courtText = courtText;
		this.courtPplLimit = courtPplLimit;
		this.courtPrice = courtPrice;
		this.courtCrtTime = courtCrtTime;
		this.courtStat = courtStat;
	}

	public Integer getCourtNo() {
		return courtNo;
	}

	public void setCourtNo(Integer courtNo) {
		this.courtNo = courtNo;
	}

	public String getCourtName() {
		return courtName;
	}

	public void setCourtName(String courtName) {
		this.courtName = courtName;
	}

	public Integer getCourtTypeNo() {
		return courtTypeNo;
	}

	public void setCourtTypeNo(Integer courtTypeNo) {
		this.courtTypeNo = courtTypeNo;
	}

	public Boolean getIndoor() {
		return indoor;
	}

	public void setIndoor(Boolean indoor) {
		this.indoor = indoor;
	}

	public String getCourtAddress() {
		return courtAddress;
	}

	public void setCourtAddress(String courtAddress) {
		this.courtAddress = courtAddress;
	}

	public Integer getSiteNo() {
		return siteNo;
	}

	public void setSiteNo(Integer siteNo) {
		this.siteNo = siteNo;
	}

	public BigDecimal getCourtLong() {
		return courtLong;
	}

	public void setCourtLong(BigDecimal courtLong) {
		this.courtLong = courtLong;
	}

	public BigDecimal getCourtLat() {
		return courtLat;
	}

	public void setCourtLat(BigDecimal courtLat) {
		this.courtLat = courtLat;
	}

	public String getCourtText() {
		return courtText;
	}

	public void setCourtText(String courtText) {
		this.courtText = courtText;
	}

	public Integer getCourtPplLimit() {
		return courtPplLimit;
	}

	public void setCourtPplLimit(Integer courtPplLimit) {
		this.courtPplLimit = courtPplLimit;
	}

	public Integer getCourtPrice() {
		return courtPrice;
	}

	public void setCourtPrice(Integer courtPrice) {
		this.courtPrice = courtPrice;
	}

	public Timestamp getCourtCrtTime() {
		return courtCrtTime;
	}

	public void setCourtCrtTime(Timestamp courtCrtTime) {
		this.courtCrtTime = courtCrtTime;
	}

	public Boolean getCourtStat() {
		return courtStat;
	}

	public void setCourtStat(Boolean courtStat) {
		this.courtStat = courtStat;
	}

	@Override
	public String toString() {
		return "CourtVO [courtNo=" + courtNo + ", courtName=" + courtName + ", courtTypeNo=" + courtTypeNo + ", indoor="
				+ indoor + ", courtAddress=" + courtAddress + ", siteNo=" + siteNo + ", courtLong=" + courtLong
				+ ", courtLat=" + courtLat + ", courtText=" + courtText + ", courtPplLimit=" + courtPplLimit
				+ ", courtPrice=" + courtPrice + ", courtCrtTime=" + courtCrtTime + ", courtStat=" + courtStat + "]";
	}

	

}
