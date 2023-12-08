package com.asap.shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ItemSize")
public class ItemSizeVO {

	@Id
	@Column(name = "ItemSizeNo", updatable = false)
	private Integer itemSizeNo;

	@Column(name = "ItemSizeText")
	private String itemSizeText;

	public ItemSizeVO() {

	}

	public ItemSizeVO(Integer itemSizeNo, String itemSizeText) {
		super();
		this.itemSizeNo = itemSizeNo;
		this.itemSizeText = itemSizeText;
	}

	public Integer getItemSizeNo() {
		return itemSizeNo;
	}

	public void setItemSizeNo(Integer itemSizeNo) {
		this.itemSizeNo = itemSizeNo;
	}

	public String getItemSizeText() {
		return itemSizeText;
	}

	public void setItemSizeText(String itemSizeText) {
		this.itemSizeText = itemSizeText;
	}

	@Override
	public String toString() {
		return "ItemSizeVO [itemSizeNo=" + itemSizeNo + ", itemSizeText=" + itemSizeText + "]";
	}

}
