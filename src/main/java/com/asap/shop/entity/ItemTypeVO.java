package com.asap.shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ItemType")
public class ItemTypeVO  {

	@Id
	@Column(name="ItemTypeNo",updatable = false)
	private Integer itemTypeNo;

	@Column(name="ItemTypeName")
	private String itemTypeName;

	public ItemTypeVO() {

	}

	public ItemTypeVO(Integer itemTypeNo, String itemTypeName) {
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

	@Override
	public String toString() {
		return "ItemTypeVO [itemTypeNo=" + itemTypeNo + ", itemTypeName=" + itemTypeName + "]";
	}



	
}
