package com.asap.backstage.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "backaccess")
public class BackAccessVO implements Serializable {
	@Id
	@Column(name = "BackAceNo", updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer backAceNo;
	@Column(name = "BackAceTypeNo")
	private Integer backAceTypeNo;
	@Column(name = "BackNo")
	private String backNo;

	public BackAccessVO() {

	}

	public BackAccessVO(Integer backAceNo, Integer backAceTypeNo, String backNo) {
		this.backAceNo = backAceNo;
		this.backAceTypeNo = backAceTypeNo;
		this.backNo = backNo;
	}

	public Integer getBackAceNo() {
		return backAceNo;
	}

	public void setBackAceNo(Integer backAceNo) {
		this.backAceNo = backAceNo;
	}

	public Integer getBackAceTypeNo() {
		return backAceTypeNo;
	}

	public void setBackAceTypeNo(Integer backAceTypeNo) {
		this.backAceTypeNo = backAceTypeNo;
	}

	public String getBackNo() {
		return backNo;
	}

	public void setBackNo(String backNo) {
		this.backNo = backNo;
	}

	@Override
	public String toString() {
		return "BackAccessVO [backAceNo=" + backAceNo + ", backAceTypeNo=" + backAceTypeNo + ", backNo=" + backNo + "]";
	}

}
