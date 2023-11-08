package com.asap.backstage;

import java.io.Serializable;

public class BackAccessVO implements Serializable {
	Integer backAceNo, backAceTypeNo;
	String backNo;

	BackAccessVO() {

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

}
