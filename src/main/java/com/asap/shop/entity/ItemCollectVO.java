package com.asap.shop.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

	@ManyToOne
	@JoinColumn(name = "ItemNo", referencedColumnName = "itemNo")
	private ItemInfoVO itemInfoVO;

	public ItemCollectVO() {

	}

	public ItemCollectVO(Integer itemCollectNo, String mbrNo, ItemInfoVO itemInfoVO) {
		super();
		this.itemCollectNo = itemCollectNo;
		this.mbrNo = mbrNo;
		this.itemInfoVO = itemInfoVO;
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

	public ItemInfoVO getItemInfoVO() {
		return itemInfoVO;
	}

	public void setItemInfoVO(ItemInfoVO itemInfoVO) {
		this.itemInfoVO = itemInfoVO;
	}


	@Override
	public String toString() {
		return "ItemCollectVO [itemCollectNo=" + itemCollectNo + ", mbrNo=" + mbrNo + ", itemInfoVO=" + itemInfoVO
				+ "]";
	}


	
}
