package com.asap.shop.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Iteminfo")
public class ItemInfoVO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ItemNo", updatable = false)
	private Integer itemNo;

	@Column(name = "ItemName")
	private String itemName;

	@Column(name = "MbrNo")
	private String mbrNo;

	@ManyToOne
	@JoinColumn(name = "ItemTypeNo", referencedColumnName = "itemTypeNo")
	private ItemTypeVO itemTypeVO;

	@ManyToOne
	@JoinColumn(name = "ItemStatNo", referencedColumnName = "itemStatNo")
	private ItemStatVO itemStatVO;

	@Column(name = "ItemText")
	private String itemText;

	@Column(name = "ItemStockQty")
	private Integer itemStockQty;

	@Column(name = "ItemPrice")
	private Integer itemPrice;

	@Column(name = "PreItemPrice")
	private Integer preItemPrice;

	@ManyToOne
	@JoinColumn(name = "ItemSizeNo", referencedColumnName = "itemSizeNo")
	private ItemSizeVO itemSizeVO;

	@Column(name = "ItemView")
	private Integer itemView;

	@Column(name = "ItemAddStat")
	private Integer itemAddStat;

	@Column(name = "ItemAddTime")
	private Timestamp itemAddTime;

	@Column(name = "ItemUpdTime")
	private Timestamp itemUpdTime;

	public ItemInfoVO() {
	}

	
	
	public ItemInfoVO(Integer itemNo) {
		super();
		this.itemNo = itemNo;
	}


	public ItemInfoVO(Integer itemNo, String itemName, String mbrNo, ItemTypeVO itemTypeVO, ItemStatVO itemStatVO,
			String itemText, Integer itemStockQty, Integer itemPrice, Integer preItemPrice, ItemSizeVO itemSizeVO,
			Integer itemView, Integer itemAddStat, Timestamp itemAddTime, Timestamp itemUpdTime) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.mbrNo = mbrNo;
		this.itemTypeVO = itemTypeVO;
		this.itemStatVO = itemStatVO;
		this.itemText = itemText;
		this.itemStockQty = itemStockQty;
		this.itemPrice = itemPrice;
		this.preItemPrice = preItemPrice;
		this.itemSizeVO = itemSizeVO;
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

	public ItemTypeVO getItemTypeVO() {
		return itemTypeVO;
	}

	public void setItemTypeVO(ItemTypeVO itemTypeVO) {
		this.itemTypeVO = itemTypeVO;
	}

	public ItemStatVO getItemStatVO() {
		return itemStatVO;
	}

	public void setItemStatVO(ItemStatVO itemStatVO) {
		this.itemStatVO = itemStatVO;
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

	public ItemSizeVO getItemSizeVO() {
		return itemSizeVO;
	}

	public void setItemSizeVO(ItemSizeVO itemSizeVO) {
		this.itemSizeVO = itemSizeVO;
	}

	public Integer getItemView() {
		return itemView;
	}

	public void setItemView(Integer itemView) {
		this.itemView = itemView;
	}

	public Integer getItemAddStat() {
		return itemAddStat;
	}

	public void setItemAddStat(Integer itemAddStat) {
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

	@Override
	public String toString() {
		return "ItemInfoVO [itemNo=" + itemNo + ", itemName=" + itemName + ", mbrNo=" + mbrNo + ", itemTypeVO="
				+ itemTypeVO + ", itemStatVO=" + itemStatVO + ", itemText=" + itemText + ", itemStockQty="
				+ itemStockQty + ", itemPrice=" + itemPrice + ", preItemPrice=" + preItemPrice + ", itemSizeVO="
				+ itemSizeVO + ", itemView=" + itemView + ", itemAddStat=" + itemAddStat + ", itemAddTime="
				+ itemAddTime + ", itemUpdTime=" + itemUpdTime + "]";
	}

}
