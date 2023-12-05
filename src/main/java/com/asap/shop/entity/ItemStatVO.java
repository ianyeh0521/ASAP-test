package com.asap.shop;

import java.io.Serializable;

public class ItemStatVO implements Serializable {
	private Integer itemStatNo;
	private String itemStatText;

	public ItemStatVO() {
	}

	public ItemStatVO(Integer itemStatNo, String itemStatText) {
		super();
		this.itemStatNo = itemStatNo;
		this.itemStatText = itemStatText;
	}

	public Integer getItemStatNo() {
		return itemStatNo;
	}

	public void setItemStatNo(Integer itemStatNo) {
		this.itemStatNo = itemStatNo;
	}

	public String getItemStatText() {
		return itemStatText;
	}

	public void setItemStatText(String itemStatText) {
		this.itemStatText = itemStatText;
	}

}
