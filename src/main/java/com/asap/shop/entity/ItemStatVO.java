package com.asap.shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ItemStat")
public class ItemStatVO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ItemStatNo", updatable = false)
	private Integer itemStatNo;

	@Column(name = "ItemStatText")
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

	@Override
	public String toString() {
		return "ItemStatVO [itemStatNo=" + itemStatNo + ", itemStatText=" + itemStatText + "]";
	}

}
