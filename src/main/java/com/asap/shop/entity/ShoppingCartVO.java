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
@Table(name = "shoppingcart")
public class ShoppingCartVO implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ShoppingCartNo")
	private Integer shoppingCartNo;

	@Column(name = "MbrNo")
	private String mbrNo;

	@ManyToOne
	@JoinColumn(name = "ItemNo", referencedColumnName = "itemNo")
	private ItemInfoVO itemInfoVO ;

	@Column(name = "ItemShopQty")
	private Integer itemShopQty;

	public ShoppingCartVO() {

	}

	public ShoppingCartVO(Integer shoppingCartNo, String mbrNo, ItemInfoVO itemInfoVO, Integer itemShopQty) {
		super();
		this.shoppingCartNo = shoppingCartNo;
		this.mbrNo = mbrNo;
		this.itemInfoVO = itemInfoVO;
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

	public ItemInfoVO getItemInfoVO() {
		return itemInfoVO;
	}

	public void setItemInfoVO(ItemInfoVO itemInfoVO) {
		this.itemInfoVO = itemInfoVO;
	}

	public Integer getItemShopQty() {
		return itemShopQty;
	}

	public void setItemShopQty(Integer itemShopQty) {
		this.itemShopQty = itemShopQty;
	}

	@Override
	public String toString() {
		return "ShoppingCartVO [shoppingCartNo=" + shoppingCartNo + ", mbrNo=" + mbrNo + ", itemInfoVO=" + itemInfoVO
				+ ", itemShopQty=" + itemShopQty + "]";
	}

}
