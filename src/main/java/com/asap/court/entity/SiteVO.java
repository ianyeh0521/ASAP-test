package com.asap.court.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;


@Entity
@Table(name="Site")
public class SiteVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SiteNo", updatable = false)
	@Expose
	private Integer siteNo;
	
	@Column(name = "Regions")
	@Expose
	private String regions;
	
	
	// 先用單向模式去找
//	@OneToMany(mappedBy = "siteVO",fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//	@Expose
//	private Set<CourtVO> courtVOs;
	
	public SiteVO() {
	}
	
	public SiteVO(Integer siteNo, String regions) {
		super();
		this.siteNo = siteNo;
		this.regions = regions;
	}

	public SiteVO(Integer siteNo) {
		this.siteNo = siteNo;
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
	
	
//	public Set<CourtVO> getCourtVOs() {
//		return courtVOs;
//	}
//
//	public void setCourtVOs(Set<CourtVO> courtVOs) {
//		this.courtVOs = courtVOs;
//	}

	@Override
	public String toString() {
		return "SiteVO [siteNo=" + siteNo + ", regions=" + regions + "]";
	}
	
	
}
