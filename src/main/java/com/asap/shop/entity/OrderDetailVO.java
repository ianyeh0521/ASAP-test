package com.asap.shop.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "orderdetail")
public class OrderDetailVO implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OrderDetailNo", nullable = false)
	private Integer orderDetailNo;

	@Column(name = "OrderNo")
	private Integer orderNo;

	@Column(name = "ItemNo")
	private Integer itemNo;

	@Column(name = "ItemOrderQty")
	private Integer itemOrderQty;

	@Column(name = "MbrNo")
	private String mbrNo;

	@Column(name = "CmtScore")
	private Integer cmtScore;

	@Column(name = "CmtText")
	private String cmtText;

	@CreationTimestamp
	@Column(name = "CmtTime")
	private Timestamp cmtTime;

	@Column(name = "CmtReText")
	private String cmtReText;

	@CreationTimestamp
	@Column(name = "CmtReTime")
	private Timestamp cmtReTime;

	@Column(name = "DelyStat")
	private boolean delyStat;

	@Column(name = "ItemOrderPrice")
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

	@Override
	public String toString() {
		return "OrderDetailVO [orderDetailNo=" + orderDetailNo + ", orderNo=" + orderNo + ", itemNo=" + itemNo
				+ ", itemOrderQty=" + itemOrderQty + ", mbrNo=" + mbrNo + ", cmtScore=" + cmtScore + ", cmtText="
				+ cmtText + ", cmtTime=" + cmtTime + ", cmtReText=" + cmtReText + ", cmtReTime=" + cmtReTime
				+ ", delyStat=" + delyStat + ", itemOrderPrice=" + itemOrderPrice + "]";
	}

}
