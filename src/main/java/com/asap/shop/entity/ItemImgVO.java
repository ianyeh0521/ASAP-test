package com.asap.shop;

import java.io.Serializable;
import java.sql.Timestamp;

public class ItemImgVO implements Serializable {
	private Integer itemImgNo;
	private Integer itemNo;
	private Byte[] itemImg;
	private Boolean itemImgfront;
	private Timestamp itemImgUpdTime;

	public ItemImgVO() {
	}

	public ItemImgVO(Integer itemImgNo, Integer itemNo, Byte[] itemImg, Boolean itemImgfront,
			Timestamp itemImgUpdTime) {
		super();
		this.itemImgNo = itemImgNo;
		this.itemNo = itemNo;
		this.itemImg = itemImg;
		this.itemImgfront = itemImgfront;
		this.itemImgUpdTime = itemImgUpdTime;
	}

	public Integer getItemImgNo() {
		return itemImgNo;
	}

	public void setItemImgNo(Integer itemImgNo) {
		this.itemImgNo = itemImgNo;
	}

	public Integer getItemNo() {
		return itemNo;
	}

	public void setItemNo(Integer itemNo) {
		this.itemNo = itemNo;
	}

	public Byte[] getItemImg() {
		return itemImg;
	}

	public void setItemImg(Byte[] itemImg) {
		this.itemImg = itemImg;
	}

	public Boolean getItemImgfront() {
		return itemImgfront;
	}

	public void setItemImgfront(Boolean itemImgfront) {
		this.itemImgfront = itemImgfront;
	}

	public Timestamp getItemImgUpdTime() {
		return itemImgUpdTime;
	}

	public void setItemImgUpdTime(Timestamp itemImgUpdTime) {
		this.itemImgUpdTime = itemImgUpdTime;
	}
}
