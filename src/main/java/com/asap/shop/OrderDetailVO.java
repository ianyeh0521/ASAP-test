package com.asap.shop;

import java.io.Serializable;
import java.sql.Timestamp;

public class OrderDetailVO implements Serializable {
	private Integer orderDetailNo;
	private Integer orderNo;
	private Integer itemNo;
	private Integer itemOrderQty;
	private String mbrNo;
	private Integer cmtScore;
	private String cmtText;
	private Timestamp cmtTime;
	private String cmtReText;
	private Timestamp cmtReTime;
	private boolean delyStat;
	private Integer itemOrderPrice;
	
	public OrderDetailVO() {
		
	}

	public OrderDetailVO(Integer orderDetailNo, Integer orderNo, Integer itemNo, Integer itemOrderQty, String mbrNo,
			Integer cmtScore, String cmtText, Timestamp cmtTime, String cmtReText, Timestamp cmtReTime,
			boolean delyStat, Integer itemOrderPrice) {
		super();
		this.orderDetailNo = orderDetailNo;
		this.orderNo = orderNo;
		this.itemNo = itemNo;
		this.itemOrderQty = itemOrderQty;
		this.mbrNo = mbrNo;
		this.cmtScore = cmtScore;
		this.cmtText = cmtText;
		this.cmtTime = cmtTime;
		this.cmtReText = cmtReText;
		this.cmtReTime = cmtReTime;
		this.delyStat = delyStat;
		this.itemOrderPrice = itemOrderPrice;
	}

	public Integer getOrderDetailNo() {
		return orderDetailNo;
	}

	public void setOrderDetailNo(Integer orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getItemNo() {
		return itemNo;
	}

	public void setItemNo(Integer itemNo) {
		this.itemNo = itemNo;
	}

	public Integer getItemOrderQty() {
		return itemOrderQty;
	}

	public void setItemOrderQty(Integer itemOrderQty) {
		this.itemOrderQty = itemOrderQty;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public Integer getCmtScore() {
		return cmtScore;
	}

	public void setCmtScore(Integer cmtScore) {
		this.cmtScore = cmtScore;
	}

	public String getCmtText() {
		return cmtText;
	}

	public void setCmtText(String cmtText) {
		this.cmtText = cmtText;
	}

	public Timestamp getCmtTime() {
		return cmtTime;
	}

	public void setCmtTime(Timestamp cmtTime) {
		this.cmtTime = cmtTime;
	}

	public String getCmtReText() {
		return cmtReText;
	}

	public void setCmtReText(String cmtReText) {
		this.cmtReText = cmtReText;
	}

	public Timestamp getCmtReTime() {
		return cmtReTime;
	}

	public void setCmtReTime(Timestamp cmtReTime) {
		this.cmtReTime = cmtReTime;
	}

	public boolean isDelyStat() {
		return delyStat;
	}

	public void setDelyStat(boolean delyStat) {
		this.delyStat = delyStat;
	}

	public Integer getItemOrderPrice() {
		return itemOrderPrice;
	}

	public void setItemOrderPrice(Integer itemOrderPrice) {
		this.itemOrderPrice = itemOrderPrice;
	}

	
}
