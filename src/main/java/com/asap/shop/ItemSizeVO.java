package com.asap.shop;

import java.io.Serializable;

public class ItemSizeVO implements Serializable {
	private Integer itemTypeNo;
	private String itemTypeName;

	public ItemSizeVO() {
	}

	public ItemSizeVO(Integer itemTypeNo, String itemTypeName) {
		super();
		this.itemTypeNo = itemTypeNo;
		this.itemTypeName = itemTypeName;
	}

	public Integer getItemTypeNo() {
		return itemTypeNo;
	}

	public void setItemTypeNo(Integer itemTypeNo) {
		this.itemTypeNo = itemTypeNo;
	}

	public String getItemTypeName() {
		return itemTypeName;
	}

	public void setItemTypeName(String itemTypeName) {
		this.itemTypeName = itemTypeName;
	}

}