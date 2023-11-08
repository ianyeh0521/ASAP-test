package com.asap.shop;

import java.io.Serializable;

public class ShoppingCartVO implements Serializable {
	private Integer shoppingCartNo;
	private String mbrNo;
	private Integer itemNo;
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

}
