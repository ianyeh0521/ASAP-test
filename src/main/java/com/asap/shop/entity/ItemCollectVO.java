	package com.asap.shop.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "itemcollect")
public class ItemCollectVO implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ItemCollectNo", nullable = false)
	private Integer itemCollectNo;

	@Column(name = "MbrNo")
	private String mbrNo;

	@Column(name = "ItemNo")
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

	@Override
	public String toString() {
		return "ItemCollectVO [itemCollectNo=" + itemCollectNo + ", mbrNo=" + mbrNo + ", itemNo=" + itemNo + "]";
	}

}
