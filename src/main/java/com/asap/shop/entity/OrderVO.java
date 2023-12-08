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
@Table(name = "`order`")
public class OrderVO implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OrderNo", nullable = false)
	private Integer orderNo;

	@Column(name = "MbrNo")
	private String mbrNo;

	@Column(name = "OrderPrice")
	private Integer orderPrice;

	@Column(name = "OrderStat")
	private Integer orderStat;
	
	@CreationTimestamp
	@Column(name = "OrderCrtTime")
	private Timestamp orderCrtTime;

	public OrderVO() {

	}

	public OrderVO(Integer orderNo, String mbrNo, Integer orderPrice, Integer orderStat, Timestamp orderCrtTime) {
		super();
		this.orderNo = orderNo;
		this.mbrNo = mbrNo;
		this.orderPrice = orderPrice;
		this.orderStat = orderStat;
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

	public Integer getOrderStat() {
		return orderStat;
	}

	public void setOrderStat(Integer orderStat) {
		this.orderStat = orderStat;
	}

	public Timestamp getOrderCrtTime() {
		return orderCrtTime;
	}

	public void setOrderCrtTime(Timestamp orderCrtTime) {
		this.orderCrtTime = orderCrtTime;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", mbrNo=" + mbrNo + ", orderPrice=" + orderPrice + ", orderStat="
				+ orderStat + ", orderCrtTime=" + orderCrtTime + "]";
	}
}
