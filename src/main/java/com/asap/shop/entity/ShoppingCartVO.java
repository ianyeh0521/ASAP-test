package com.asap.shop.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "shoppingcart")
public class ShoppingCartVO implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ShoppingCartNo")
	private Integer shoppingCartNo;

	@Column(name = "MbrNo")
	private String mbrNo;

	@Column(name = "ItemNo")
	private Integer itemNo;

	@Column(name = "ItemShopQty")
	private Integer itemShopQty;

	public ShoppingCartVO() {

	}

	public ShoppingCartVO(Integer shoppingCartNo, String mbrNo, Integer itemNo, Integer itemShopQty) {
		super();
		this.shoppingCartNo = shoppingCartNo;
		this.mbrNo = mbrNo;
		this.itemNo = itemNo;
		this.itemShopQty = itemShopQty;
	}

	public Integer getShoppingCartNo() {
		return shoppingCartNo;
	}

	public void setShoppingCartNo(Integer shoppingCartNo) {
		this.shoppingCartNo = shoppingCartNo;
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

	public Integer getItemShopQty() {
		return itemShopQty;
	}

	public void setItemShopQty(Integer itemShopQty) {
		this.itemShopQty = itemShopQty;
	}

	@Override
	public String toString() {
		return "ShoppingCartVO [shoppingCartNo=" + shoppingCartNo + ", mbrNo=" + mbrNo + ", itemNo=" + itemNo
				+ ", itemShopQty=" + itemShopQty + "]";
	}

}
