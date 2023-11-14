package com.asap.court;

import java.io.Serializable;

public class SiteVO implements Serializable{

	private Integer siteNo;
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
	
	
}
