package com.asap.backstage;

import java.io.Serializable;

import java.sql.Timestamp;

public class BackStageVO implements Serializable {
	private String backNo, backEmail, backPwd, backName, backPhone;
	private Timestamp backSetTime, backUpdTime;
	private Boolean backStat;

	public BackStageVO() {
	}

	public BackStageVO(String backNo, String backEmail, String backPwd, String backName, String backPhone,
			Timestamp backSetTime, Timestamp backUpdTime, Boolean backStat) {

		this.backNo = backNo;
		this.backEmail = backEmail;
		this.backPwd = backPwd;
		this.backName = backName;
		this.backPhone = backPhone;
		this.backSetTime = backSetTime;
		this.backUpdTime = backUpdTime;
		this.backStat = backStat;
	}

	public String getBackNo() {
		return backNo;
	}

	public String getBackEmail() {
		return backEmail;
	}

	public String getBackPwd() {
		return backPwd;
	}

	public String getBackName() {
		return backName;
	}

	public String getBackPhone() {
		return backPhone;
	}

	public Timestamp getBackSetTime() {
		return backSetTime;
	}

	public Timestamp getBackUpdTime() {
		return backUpdTime;
	}

	public Boolean getBackStat() {
		return backStat;
	}

	public void setBackNo(String backNo) {
		this.backNo = backNo;
	}

	public void setBackEmail(String backEmail) {
		this.backEmail = backEmail;
	}

	public void setBackPwd(String backPwd) {
		this.backPwd = backPwd;
	}

	public void setBackName(String backName) {
		this.backName = backName;
	}

	public void setBackPhone(String backPhone) {
		this.backPhone = backPhone;
	}

	public void setBackSetTime(Timestamp backSetTime) {
		this.backSetTime = backSetTime;
	}

	public void setBackUpdTime(Timestamp backUpdTime) {
		this.backUpdTime = backUpdTime;
	}

	public void setBackStat(Boolean backStat) {
		this.backStat = backStat;
	}

}
