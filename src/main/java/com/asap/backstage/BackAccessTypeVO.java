package com.asap.backstage;

import java.io.Serializable;

public class BackAccessTypeVO implements Serializable {
	private Integer backAceTypeNo;
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

}
