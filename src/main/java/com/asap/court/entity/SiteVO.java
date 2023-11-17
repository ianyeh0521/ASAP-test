package com.asap.court.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="Site")
public class SiteVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SiteNo", updatable = false)
	private Integer siteNo;
	
	@Column(name = "Regions")
	private String regions;
	
	public SiteVO() {
	}
	
	public SiteVO(Integer siteNo, String regions) {
		super();
		this.siteNo = siteNo;
		this.regions = regions;
	}

	public Integer getSiteNo() {
		return siteNo;
	}

	public void setSiteNo(Integer siteNo) {
		this.siteNo = siteNo;
	}

	public String getRegions() {
		return regions;
	}

	public void setRegions(String regions) {
		this.regions = regions;
	}

	@Override
	public String toString() {
		return "SiteVO [siteNo=" + siteNo + ", regions=" + regions + "]";
	}
	
	
}
