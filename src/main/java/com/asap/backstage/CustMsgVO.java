package com.asap.backstage;

import java.io.Serializable;
import java.sql.Timestamp;

public class CustMsgVO implements Serializable {

	private Integer custMsgNo;
	private String custMsgSubj, custMsgText, mbrNo, coachNo, backNo, custReText;
	private Timestamp custMsgTime, custMsgReTime;

	public CustMsgVO() {
	}

	public CustMsgVO(Integer custMsgNo, String custMsgSubj, String custMsgText, String mbrNo, String coachNo,
			String backNo, String custReText, Timestamp custMsgTime, Timestamp custMsgReTime) {
		this.custMsgNo = custMsgNo;
		this.custMsgSubj = custMsgSubj;
		this.custMsgText = custMsgText;
		this.mbrNo = mbrNo;
		this.coachNo = coachNo;
		this.backNo = backNo;
		this.custReText = custReText;
		this.custMsgTime = custMsgTime;
		this.custMsgReTime = custMsgReTime;
	}

	public Integer getCustMsgNo() {
		return custMsgNo;
	}

	public void setCustMsgNo(Integer custMsgNo) {
		this.custMsgNo = custMsgNo;
	}

	public String getCustMsgSubj() {
		return custMsgSubj;
	}

	public void setCustMsgSubj(String custMsgSubj) {
		this.custMsgSubj = custMsgSubj;
	}

	public String getCustMsgText() {
		return custMsgText;
	}

	public void setCustMsgText(String custMsgText) {
		this.custMsgText = custMsgText;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public String getCoachNo() {
		return coachNo;
	}

	public void setCoachNo(String coachNo) {
		this.coachNo = coachNo;
	}

	public String getBackNo() {
		return backNo;
	}

	public void setBackNo(String backNo) {
		this.backNo = backNo;
	}

	public String getCustReText() {
		return custReText;
	}

	public void setCustReText(String custReText) {
		this.custReText = custReText;
	}

	public Timestamp getCustMsgTime() {
		return custMsgTime;
	}

	public void setCustMsgTime(Timestamp custMsgTime) {
		this.custMsgTime = custMsgTime;
	}

	public Timestamp getCustMsgReTime() {
		return custMsgReTime;
	}

	public void setCustMsgReTime(Timestamp custMsgReTime) {
		this.custMsgReTime = custMsgReTime;
	}

}
