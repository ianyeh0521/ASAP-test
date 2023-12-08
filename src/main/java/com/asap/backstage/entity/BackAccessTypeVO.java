package com.asap.backstage.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "backaccesstype")
public class BackAccessTypeVO implements Serializable {

	@Id
	@Column(name = "BackAceTypeNo", updatable = false)
	private Integer backAceTypeNo;
	@Column(name = "BackAceTypeName")
	private String backAceTypeName;

	public BackAccessTypeVO() {
	}

	public BackAccessTypeVO(Integer backAceTypeNo, String backAceTypeName) {
		this.backAceTypeNo = backAceTypeNo;
		this.backAceTypeName = backAceTypeName;
	}

	public Integer getBackAceTypeNo() {
		return backAceTypeNo;
	}

	public void setBackAceTypeNo(Integer backAceTypeNo) {
		this.backAceTypeNo = backAceTypeNo;
	}

	public String getBackAceTypeName() {
		return backAceTypeName;
	}

	public void setBackAceTypeName(String backAceTypeName) {
		this.backAceTypeName = backAceTypeName;
	}

	@Override
	public String toString() {
		return "BackAccessTypeVO [backAceTypeNo=" + backAceTypeNo + ", backAceTypeName=" + backAceTypeName + "]";
	}

}
