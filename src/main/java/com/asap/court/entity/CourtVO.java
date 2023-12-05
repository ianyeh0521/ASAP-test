 package com.asap.court.entity;


import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.google.gson.annotations.Expose;




@Entity
@Table(name="Court")
public class CourtVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourtNo", updatable = false)
	private Integer courtNo;
	
	@Column(name = "CourtName")
	private String courtName;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "CourtTypeNo", referencedColumnName = "CourtTypeNo")
	private CourtTypeVO courtTypeVO;
	
	@Column(name = "Indoor")
	private Boolean indoor;
	
	@Column(name = "CourtAddress")
	private String courtAddress;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "SiteNo", referencedColumnName = "SiteNo")
	private SiteVO siteVO ;
	
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
	
	@Column(name = "CourtCrtTime", nullable = false, updatable = false)
	@CreationTimestamp
	private Timestamp courtCrtTime;
	
	@Column(name = "CourtStat")
	private Boolean courtStat;
	
//	@OneToMany(mappedBy = "courtVO")
//	private List<CourtImgVO> courtImgVOs;


	public CourtVO() {
	}



	public CourtVO(String courtName, CourtTypeVO courtTypeVO, Boolean indoor, String courtAddress, SiteVO siteVO,
			BigDecimal courtLong, BigDecimal courtLat, String courtText, Integer courtPplLimit, Integer courtPrice,
			Boolean courtStat) {
		super();
		this.courtName = courtName;
		this.courtTypeVO = courtTypeVO;
		this.indoor = indoor;
		this.courtAddress = courtAddress;
		this.siteVO = siteVO;
		this.courtLong = courtLong;
		this.courtLat = courtLat;
		this.courtText = courtText;
		this.courtPplLimit = courtPplLimit;
		this.courtPrice = courtPrice;
		this.courtStat = courtStat;
	}
	

	public CourtVO(Integer courtNo, String courtName, CourtTypeVO courtTypeVO, Boolean indoor, String courtAddress,
			SiteVO siteVO, BigDecimal courtLong, BigDecimal courtLat, String courtText, Integer courtPplLimit,
			Integer courtPrice, Boolean courtStat) {
		super();
		this.courtNo = courtNo;
		this.courtName = courtName;
		this.courtTypeVO = courtTypeVO;
		this.indoor = indoor;
		this.courtAddress = courtAddress;
		this.siteVO = siteVO;
		this.courtLong = courtLong;
		this.courtLat = courtLat;
		this.courtText = courtText;
		this.courtPplLimit = courtPplLimit;
		this.courtPrice = courtPrice;
		this.courtStat = courtStat;
	}



	public CourtVO(Integer courtNo, String courtName, CourtTypeVO courtTypeVO, Boolean indoor, String courtAddress,
			SiteVO siteVO, BigDecimal courtLong, BigDecimal courtLat, String courtText, Integer courtPplLimit,
			Integer courtPrice, Timestamp courtCrtTime, Boolean courtStat) {
		super();
		this.courtNo = courtNo;
		this.courtName = courtName;
		this.courtTypeVO = courtTypeVO;
		this.indoor = indoor;
		this.courtAddress = courtAddress;
		this.siteVO = siteVO;
		this.courtLong = courtLong;
		this.courtLat = courtLat;
		this.courtText = courtText;
		this.courtPplLimit = courtPplLimit;
		this.courtPrice = courtPrice;
		this.courtCrtTime = courtCrtTime;
		this.courtStat = courtStat;
	}



	public CourtVO(Integer courtNo) {
		this.courtNo = courtNo;
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



	public CourtTypeVO getCourtTypeVO() {
		return courtTypeVO;
	}



	public void setCourtTypeVO(CourtTypeVO courtTypeVO) {
		this.courtTypeVO = courtTypeVO;
	}



	public SiteVO getSiteVO() {
		return siteVO;
	}



	public void setSiteVO(SiteVO siteVO) {
		this.siteVO = siteVO;
	}





//	public List<CourtImgVO> getCourtImgVOs() {
//		return courtImgVOs;
//	}
//
//
//
//	public void setCourtImgs(List<CourtImgVO> courtImgVOs) {
//		this.courtImgVOs = courtImgVOs;
//	}



	@Override
	public String toString() {
		return "CourtVO [courtNo=" + courtNo + ", courtName=" + courtName + ", courtTypeVO=" + courtTypeVO + ", indoor="
				+ indoor + ", courtAddress=" + courtAddress + ", siteVO=" + siteVO + ", courtLong=" + courtLong
				+ ", courtLat=" + courtLat + ", courtText=" + courtText + ", courtPplLimit=" + courtPplLimit
				+ ", courtPrice=" + courtPrice + ", courtCrtTime=" + courtCrtTime + ", courtStat=" + courtStat + "]";
	}


	

}
