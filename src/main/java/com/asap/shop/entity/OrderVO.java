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
	@Column(name = "OrderNo", updatable = false)
	private Integer orderNo;

	@Column(name = "MbrNo")
	private String mbrNo;

	@Column(name = "OrderPrice")
	private Integer orderPrice;

	@Column(name = "OrderStat")
	private Integer orderStat;

	@Column(name = "RcvrName")
	private String rcvrName;

	@Column(name = "RcvrEmail")
	private String rcvrEmail;

	@Column(name = "RcvrPhone")
	private String rcvrPhone;

	@Column(name = "RcvrAddr")
	private String rcvrAddr;

	@CreationTimestamp
	@Column(name = "OrderCrtTime")
	private Timestamp orderCrtTime;


	@Column(name = "OrderCancelTime")
	private Timestamp orderCancelTime;

	public OrderVO() {

	}

	public OrderVO(Integer orderNo, String mbrNo, Integer orderPrice, Integer orderStat, String rcvrName,
			String rcvrEmail, String rcvrPhone, String rcvrAddr, Timestamp orderCrtTime, Timestamp orderCancelTime) {
		super();
		this.orderNo = orderNo;
		this.mbrNo = mbrNo;
		this.orderPrice = orderPrice;
		this.orderStat = orderStat;
		this.rcvrName = rcvrName;
		this.rcvrEmail = rcvrEmail;
		this.rcvrPhone = rcvrPhone;
		this.rcvrAddr = rcvrAddr;
		this.orderCrtTime = orderCrtTime;
		this.orderCancelTime = orderCancelTime;
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

	public String getRcvrName() {
		return rcvrName;
	}

	public void setRcvrName(String rcvrName) {
		this.rcvrName = rcvrName;
	}

	public String getRcvrEmail() {
		return rcvrEmail;
	}

	public void setRcvrEmail(String rcvrEmail) {
		this.rcvrEmail = rcvrEmail;
	}

	public String getRcvrPhone() {
		return rcvrPhone;
	}

	public void setRcvrPhone(String rcvrPhone) {
		this.rcvrPhone = rcvrPhone;
	}

	public String getRcvrAddr() {
		return rcvrAddr;
	}

	public void setRcvrAddr(String rcvrAddr) {
		this.rcvrAddr = rcvrAddr;
	}

	public Timestamp getOrderCrtTime() {
		return orderCrtTime;
	}

	public void setOrderCrtTime(Timestamp orderCrtTime) {
		this.orderCrtTime = orderCrtTime;
	}

	public Timestamp getOrderCancelTime() {
		return orderCancelTime;
	}

	public void setOrderCancelTime(Timestamp orderCancelTime) {
		this.orderCancelTime = orderCancelTime;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", mbrNo=" + mbrNo + ", orderPrice=" + orderPrice + ", orderStat="
				+ orderStat + ", rcvrName=" + rcvrName + ", rcvrEmail=" + rcvrEmail + ", rcvrPhone=" + rcvrPhone
				+ ", rcvrAddr=" + rcvrAddr + ", orderCrtTime=" + orderCrtTime + ", orderCancelTime=" + orderCancelTime
				+ "]";
	}

}
