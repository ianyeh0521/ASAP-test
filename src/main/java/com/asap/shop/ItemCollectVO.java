package com.asap.shop;

import java.io.Serializable;

public class ItemCollectVO implements Serializable {
	private Integer itemCollectNo;
	private String mbrNo;
	private Integer itemNo;
	
	public ItemCollectVO() {
		
	}

	public ItemCollectVO(Integer itemCollectNo, String mbrNo, Integer itemNo) {
		super();
		this.itemCollectNo = itemCollectNo;
		this.mbrNo = mbrNo;
		this.itemNo = itemNo;
	}

	public Integer getItemCollectNo() {
		return itemCollectNo;
	}

	public void setItemCollectNo(Integer itemCollectNo) {
		this.itemCollectNo = itemCollectNo;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public Integer getItemNo() {
		return itemNo;
	}

	public void setItemNo(Integer itemNo) {
		this.itemNo = itemNo;
	}
	
}
