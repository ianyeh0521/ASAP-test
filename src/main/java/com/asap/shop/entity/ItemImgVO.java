package com.asap.shop.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Itemimg")
public class ItemImgVO implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ItemImgNo", updatable = false, nullable = false)
	private Integer itemImgNo;
	
	@Column(name = "ItemNo")
    private Integer itemNo; 
	
	
	@Column(name = "ItemImg", columnDefinition = "longblob")
	private byte[] itemImg;
	
	@Column(name = "ItemImgfront")
	private Boolean itemImgfront;
	
	@Column(name = "ItemImgUpdTime")
	private Timestamp itemImgUpdTime;

	public ItemImgVO() {
	}

	public ItemImgVO(Integer itemImgNo, Integer itemNo, byte[] itemImg, Boolean itemImgfront,
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

	public byte[] getItemImg() {
		return itemImg;
	}

	public void setItemImg(byte[] itemImg) {
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
