package com.asap.court;

import java.io.Serializable;

public class Site implements Serializable{

	private Integer siteNo;
	private String regions;
	
	public Site() {
	}
	
	public Site(Integer siteNo, String regions) {
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
