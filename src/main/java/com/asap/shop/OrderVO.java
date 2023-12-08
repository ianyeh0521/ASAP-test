package com.asap.shop;

import java.io.Serializable;
import java.sql.Timestamp;

public class OrderVO implements Serializable {
	private Integer orderNo;
	private String mbrNo;
	private Integer orderPrice;
	private Boolean orderPayStat;
	private Timestamp orderCrtTime;
	
	public OrderVO() {
	}

	public OrderVO(Integer orderNo, String mbrNo, Integer orderPrice, Boolean orderPayStat, Timestamp orderCrtTime) {
		super();
		this.orderNo = orderNo;
		this.mbrNo = mbrNo;
		this.orderPrice = orderPrice;
		this.orderPayStat = orderPayStat;
		this.orderCrtTime = orderCrtTime;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public Integer getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Boolean getOrderPayStat() {
		return orderPayStat;
	}

	public void setOrderPayStat(Boolean orderPayStat) {
		this.orderPayStat = orderPayStat;
	}

	public Timestamp getOrderCrtTime() {
		return orderCrtTime;
	}

	public void setOrderCrtTime(Timestamp orderCrtTime) {
		this.orderCrtTime = orderCrtTime;
	}
	
}
