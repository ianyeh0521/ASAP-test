package com.asap.shop;

import java.io.Serializable;
import java.sql.Timestamp;

public class ItemInfoVO implements Serializable {
	private Integer itemNo;
	private String itemName;
	private String mbrNo;
	private Integer itemTypeNo;
	private Integer itemStatNo;
	private String itemText;
	private Integer itemStockQty;
	private Integer itemPrice;
	private Integer preItemPrice;
	private Integer itemSizeNo;
	private Integer itemView;
	private Boolean itemAddStat;
	private Timestamp itemAddTime;
	private Timestamp itemUpdTime;

	public ItemInfoVO() {
	}

	public ItemInfoVO(Integer itemNo, String itemName, String mbrNo, Integer itemTypeNo, Integer itemStatNo,
			String itemText, Integer itemStockQty, Integer itemPrice, Integer preItemPrice, Integer itemSizeNo,
			Integer itemView, Boolean itemAddStat, Timestamp itemAddTime, Timestamp itemUpdTime) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.mbrNo = mbrNo;
		this.itemTypeNo = itemTypeNo;
		this.itemStatNo = itemStatNo;
		this.itemText = itemText;
		this.itemStockQty = itemStockQty;
		this.itemPrice = itemPrice;
		this.preItemPrice = preItemPrice;
		this.itemSizeNo = itemSizeNo;
		this.itemView = itemView;
		this.itemAddStat = itemAddStat;
		this.itemAddTime = itemAddTime;
		this.itemUpdTime = itemUpdTime;
	}

	public Integer getItemNo() {
		return itemNo;
	}

	public void setItemNo(Integer itemNo) {
		this.itemNo = itemNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public Integer getItemTypeNo() {
		return itemTypeNo;
	}

	public void setItemTypeNo(Integer itemTypeNo) {
		this.itemTypeNo = itemTypeNo;
	}

	public Integer getItemStatNo() {
		return itemStatNo;
	}

	public void setItemStatNo(Integer itemStatNo) {
		this.itemStatNo = itemStatNo;
	}

	public String getItemText() {
		return itemText;
	}

	public void setItemText(String itemText) {
		this.itemText = itemText;
	}

	public Integer getItemStockQty() {
		return itemStockQty;
	}

	public void setItemStockQty(Integer itemStockQty) {
		this.itemStockQty = itemStockQty;
	}

	public Integer getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(Integer itemPrice) {
		this.itemPrice = itemPrice;
	}

	public Integer getPreItemPrice() {
		return preItemPrice;
	}

	public void setPreItemPrice(Integer preItemPrice) {
		this.preItemPrice = preItemPrice;
	}

	public Integer getItemSizeNo() {
		return itemSizeNo;
	}

	public void setItemSizeNo(Integer itemSizeNo) {
		this.itemSizeNo = itemSizeNo;
	}

	public Integer getItemView() {
		return itemView;
	}

	public void setItemView(Integer itemView) {
		this.itemView = itemView;
	}

	public Boolean getItemAddStat() {
		return itemAddStat;
	}

	public void setItemAddStat(Boolean itemAddStat) {
		this.itemAddStat = itemAddStat;
	}

	public Timestamp getItemAddTime() {
		return itemAddTime;
	}

	public void setItemAddTime(Timestamp itemAddTime) {
		this.itemAddTime = itemAddTime;
	}

	public Timestamp getItemUpdTime() {
		return itemUpdTime;
	}

	public void setItemUpdTime(Timestamp itemUpdTime) {
		this.itemUpdTime = itemUpdTime;
	}
}
